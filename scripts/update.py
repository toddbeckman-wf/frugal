import argparse
import os
import re
from subprocess import call

from lang import Dart, Go, Java


LANGUAGES = {
    "dart": Dart(),
    "go": Go(),
    "java": Java(),
}

_VERSION_MATCH = '.*?\..*?\..*?'


def main(args):
    root = os.getcwd().rstrip('/')
    if args.version:
        update_frugal_version(args.version, root)


def update_frugal_version(version, root):
    """Update the frugal version."""
    # TODO: Implement dry run
    update_compiler(version, root)
    for lang in LANGUAGES.itervalues():
        lang.update_frugal(version, root)
    update_tests(version, root)
    update_examples(version, root)


def update_compiler(version, root):
    """Update the frugal compiler."""
    # Update the global version
    os.chdir('{0}/compiler/globals'.format(root))
    base_str = 'const Version = \"{0}\"'
    sub_str = base_str.format(_VERSION_MATCH)
    ver_str = base_str.format(version)
    glob = 'globals.go'
    s = ''
    with open(glob, 'r') as f:
        s = re.sub(sub_str, ver_str, f.read())
    with open(glob, 'w') as f:
        f.write(s)
    # Install the binary with the updated version
    os.chdir(root)
    if call(['go', 'install']) != 0:
        raise Exception('installing frugal binary failed')


def update_tests(version, root):
    """Update the frugal generation tests."""
    os.chdir('{0}/test/expected'.format(root))
    _update_tests_and_recurse(version)


def _update_tests_and_recurse(version):
    cwd = os.getcwd().rstrip('/')
    sub_str = 'Autogenerated by Frugal Compiler \({0}\)'.format(_VERSION_MATCH)
    ver_str = 'Autogenerated by Frugal Compiler ({0})'.format(version)
    # Reformat all files
    for f in [f for f in os.listdir(cwd) if os.path.isfile(f)]:
        with open(f, 'r') as t:
            s = re.sub(sub_str, ver_str, t.read())
        with open(f, 'w') as t:
            t.write(s)
    # Recurse on all directories
    for d in [d for d in os.listdir(cwd) if os.path.isdir(d)]:
        os.chdir('{0}/{1}'.format(cwd, d))
        _update_tests_and_recurse(version)


def update_examples(version, root):
    """Update the examples."""
    os.chdir('{0}/example'.format(root))
    # TODO: Replace the generate example shell script
    if call(['./generate_code.sh']) != 0:
        raise Exception('Failed to generate example code')


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='Update version'
    )
    parser.add_argument('--version', dest='version', type=str)
    args = parser.parse_args()
    main(args)
