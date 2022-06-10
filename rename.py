#!/usr/bin/env python3

import pathlib
import re
import sys

def find_file(path, target):
    target_path = path.parent / target
    if not target_path.exists():
        if path.parent == path:
            return None

        return find_file(path.parent, target)

    return target_path


def try_rename_in(path, target, jsm_name, esm_name):
    target_path = find_file(path, target)
    if not target_path:
        return False

    with open(target_path, 'r') as f:
        content = f.read()

    jsm_name_re = re.compile(r'\b' + jsm_name.replace('.', r'\.') + r'\b')

    if not jsm_name_re.search(content):
        return False

    print(str(target_path))
    print(' ', path, '=>', esm_name)

    content = jsm_name_re.sub(esm_name, content)
    with open(target_path, 'w') as f:
        f.write(content)

    return True


def try_rename_components_conf(path, jsm_name, esm_name):
    target_path = find_file(path, 'components.conf')
    if not target_path:
        return False

    with open(target_path, 'r') as f:
        content = f.read()

    prop_re = re.compile('["\']jsm["\']:(.*)'
                         + r'\b' + jsm_name.replace('.', r'\.') + r'\b')

    if not prop_re.search(content):
        return False

    print(str(target_path))
    print(' ', path, '=>', esm_name)

    content = prop_re.sub("'esm':\\1" + esm_name, content)
    with open(target_path, 'w') as f:
        f.write(content)

    return True


def rename(file):
    path = pathlib.Path(file)

    jsm_name = path.name
    esm_name = re.sub(r'\.(jsm|js|jsm\.js)$', '.sys.mjs', jsm_name)

    target_files = [
        'moz.build',
        'jar.mn',
        'browser.ini',
        'browser-common.ini',
        'chrome.ini',
        'mochitest.ini',
        'xpcshell.ini',
        'xpcshell-child-process.ini',
        'xpcshell-common.ini',
        'xpcshell-parent-process.ini',
    ]

    renamed = False
    for target in target_files:
        if try_rename_in(path, target, jsm_name, esm_name):
            renamed = True

    if try_rename_components_conf(path, jsm_name, esm_name):
        renamed = True

    if not renamed:
        return

    path.rename(path.parent / esm_name)

if len(sys.argv) != 2:
    print('Usage: rename.py RELATIVE_PATH_TO_JSM_FROM_MOZILLA_UNIFIED')
    sys.exit(1)

rename(sys.argv[1])
