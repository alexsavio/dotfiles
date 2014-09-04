#!/usr/bin/env python

import os
import sys
import shutil
import tempfile
import subprocess

ipynbf = sys.argv[1]

cur_dir = os.path.abspath(os.curdir)
statics_dir = os.path.expanduser('~/Dropbox/Documents/ipynb/templates')

with tempfile.TemporaryDirectory() as tmp_dir:
    print('ipynb_present.py: Working on temp dir {}'.format(tmp_dir))
    slides_dir = os.path.join(tmp_dir, 'slides')
    shutil.copytree(statics_dir, slides_dir)
    shutil.copy(os.path.realpath(ipynbf), slides_dir)

    try:
        os.chdir(slides_dir)
        subprocess.check_call('ipython nbconvert {} --to slides --post serve '\
                              '--config slides_config.py'.format(ipynbf), shell=True)
    finally:
        os.chdir(cur_dir)
        #shutil.rmtree(slides_dir)

