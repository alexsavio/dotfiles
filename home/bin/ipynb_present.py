#!/usr/bin/env python

import os
import sys
import shutil
import tempfile
import subprocess

if __name__ == '__main__':

    ipynbf = sys.argv[1]

    if not os.path.exists(ipynbf):
        print('Could not find file: {}'.format(ipynbf))
        exit(-1)

    cur_dir = os.path.abspath(os.curdir)

    #check for 'statics 'templates' dir
    ipynb_path = os.path.dirname(os.path.realpath(ipynbf))
    if os.path.exists(os.path.join(ipynb_path, 'templates')):
        statics_dir = os.path.join(ipynb_path, 'templates')
    else:
        statics_dir = os.path.expanduser('~/Dropbox/Documents/ipynb/templates')

    if os.path.exists(statics_dir):
        print('Using templates folder from: {}'.format(statics_dir))

    #create temporary folder
    tmp_dir = tempfile.mkdtemp(prefix='ipynb_present_')

    #work in non-existent folder within the tmp_dir so shutil.copytree can work
    print('ipynb_present.py: Working on temp dir {}'.format(tmp_dir))
    slides_dir = os.path.join(tmp_dir, 'slides')

    #copy templates contents
    if os.path.exists(statics_dir):
        shutil.copytree(statics_dir, slides_dir)
    else:
        slides_dir = tmp_dir

    #copy the ipynb file
    shutil.copy(os.path.realpath(ipynbf), slides_dir)

    #change dir and serve
    try:
        os.chdir(slides_dir)
        subprocess.check_call('ipython nbconvert {} --to slides --post serve '\
                              '--config slides_config.py'.format(ipynbf), shell=True)
    finally:
        os.chdir(cur_dir)
        shutil.rmtree(tmp_dir)

