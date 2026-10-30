import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
FEED = '''<rss xmlns:content="http://purl.org/rss/1.0/modules/content/">
<channel><item><title>A writer's corner</title>
<link>https://neutralzone.substack.com/p/a-writers-corner</link>
<pubDate>Mon, 19 Oct 2026 14:31:02 GMT</pubDate>
<content:encoded><![CDATA[<p>Hello <strong>world</strong>.</p>]]></content:encoded>
</item></channel></rss>'''
POST = 'content/archive/2026-10-19-a-writers-corner.md'


class SyncTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        self.repo = self.base / 'repo'
        self.repo.mkdir()
        (self.repo / 'scripts').mkdir()
        (self.repo / 'content/archive').mkdir(parents=True)
        shutil.copy(ROOT / 'scripts/sync-substack.sh', self.repo / 'scripts')
        self.bin = self.base / 'bin'
        self.bin.mkdir()
        curl = self.bin / 'curl'
        curl.write_text('#!/bin/bash\nif [[ ${FAIL_FETCH:-0} == 1 ]]; then exit 22; fi\nwhile [[ $# -gt 0 ]]; do\n if [[ $1 == -o ]]; then cp "$TEST_FEED" "$2"; exit; fi\n shift\ndone\nexit 2\n')
        curl.chmod(0o755)
        self.feed = self.base / 'feed.xml'
        self.feed.write_text(FEED)
        self.env = dict(os.environ, TEST_FEED=str(self.feed),
                        PATH=f'{self.bin}:{ROOT / ".tools/bin"}:{os.environ["PATH"]}')
        self.git('init', '-b', 'main')
        self.git('config', 'user.email', 'sync-test@example.invalid')
        self.git('config', 'user.name', 'Sync test')
        self.git('add', '.')
        self.git('commit', '-m', 'fixture')
        self.remote = self.base / 'remote.git'
        subprocess.run(['git', 'init', '--bare', '-b', 'main', str(self.remote)],
                       check=True, capture_output=True)
        self.git('remote', 'add', 'origin', str(self.remote))
        self.git('push', '-u', 'origin', 'main')

    def git(self, *args):
        return subprocess.run(['git', *args], cwd=self.repo, env=self.env,
                              check=True, text=True, capture_output=True).stdout.strip()

    def sync(self, *args):
        return subprocess.run(['bash', 'scripts/sync-substack.sh', *args],
                              cwd=self.repo, env=self.env, text=True, capture_output=True)

    def test_import_is_repeatable_and_preserves_existing_edits(self):
        run = self.sync()
        self.assertEqual(run.returncode, 0, run.stderr)
        post = self.repo / POST
        self.assertIn('Hello **world**.', post.read_text())
        post.write_text('An edited copy.\n')
        run = self.sync()
        self.assertEqual(run.returncode, 0, run.stderr)
        self.assertEqual(post.read_text(), 'An edited copy.\n')

    def test_publish_commits_and_pushes_even_on_retry_without_new_posts(self):
        run = self.sync('--publish')
        self.assertEqual(run.returncode, 0, run.stderr)
        self.assertIn(POST, self.git('--git-dir', str(self.remote), 'ls-tree', '-r', '--name-only', 'main'))
        head = self.git('rev-parse', 'HEAD')
        # Model a previous successful commit whose push never reached the remote.
        self.git('--git-dir', str(self.remote), 'update-ref', 'refs/heads/main', 'HEAD~1')
        run = self.sync('--publish')
        self.assertEqual(run.returncode, 0, run.stderr)
        self.assertEqual(self.git('rev-parse', 'HEAD'), head)
        self.assertEqual(self.git('--git-dir', str(self.remote), 'rev-parse', 'main'), head)

    def test_failed_fetch_never_imports_a_stale_feed(self):
        self.env['FAIL_FETCH'] = '1'
        run = self.sync()
        self.assertNotEqual(run.returncode, 0)
        self.assertFalse((self.repo / POST).exists())

    def test_bad_feed_is_an_error(self):
        self.feed.write_text('<html>Challenge</html>')
        run = self.sync()
        self.assertNotEqual(run.returncode, 0)
        self.assertFalse((self.repo / POST).exists())

    def test_failed_conversion_is_an_error(self):
        pandoc = self.bin / 'pandoc'
        pandoc.write_text('#!/bin/sh\necho conversion-failed >&2\nexit 1\n')
        pandoc.chmod(0o755)
        run = self.sync()
        self.assertNotEqual(run.returncode, 0)
        self.assertFalse((self.repo / POST).exists())

    def test_publish_refuses_unrelated_work(self):
        (self.repo / 'draft.txt').write_text('Still writing this.')
        before = self.git('--git-dir', str(self.remote), 'rev-parse', 'main')
        run = self.sync('--publish')
        self.assertNotEqual(run.returncode, 0)
        self.assertEqual(self.git('--git-dir', str(self.remote), 'rev-parse', 'main'), before)
        self.assertFalse((self.repo / POST).exists())


if __name__ == '__main__':
    unittest.main()
