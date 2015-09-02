#!/usr/bin/env python

import os
import os.path as op
import sys
import shutil
import tempfile
import logging
import argparse
import subprocess


def create_argparser():
    parser = argparse.ArgumentParser(description='Launch web server to present'
                                                 ' the notebook slides from a '
                                                 ' temporary folder.')
    parser.add_argument('-n', '--notebook', action='store',
                        dest='notebook', default='a',
                        help='The IPython notebook file path.')
    parser.add_argument('-o', '--other', action='append', dest='others', default=[],
                        help='Other files needed by the notebook.'
                             'This flag can be used more than once.')
    return parser

if __name__ == '__main__':

    logging.basicConfig(level=logging.INFO)
    log = logging.getLogger(__name__)

    parser = create_argparser()
    try:
        args = parser.parse_args()
    except argparse.ArgumentError as exc:
        log.exception('Error parsing arguments.')
        parser.error(str(exc.message))
        raise

    ipynbf = args.notebook
    others = args.others

    if not op.exists(ipynbf):
        raise IOError('Could not find file: {}'.format(ipynbf))

    cur_dir = op.abspath(os.curdir)

    #check for 'statics 'templates' dir
    ipynb_path = op.dirname(op.realpath(ipynbf))
    statics_dir = op.join(ipynb_path, 'templates')
    if not op.exists(statics_dir):
        statics_dir = op.expanduser('~/Dropbox/Documents/ipynb/templates')

    if op.exists(statics_dir):
        log.info('Using templates folder from: {}'.format(statics_dir))

    #create temporary folder
    tmp_dir = tempfile.mkdtemp(prefix='ipynb_present_')

    #work in non-existent folder within the tmp_dir so shutil.copytree can work
    log.info('ipynb_present.py: Working on temp dir {}'.format(tmp_dir))
    slides_dir = op.join(tmp_dir, 'slides')

    try:
        #copy templates contents
        if op.exists(statics_dir):
            shutil.copytree(statics_dir, slides_dir)
        else:
            slides_dir = tmp_dir

        #copy the ipynb file
        shutil.copy(op.realpath(ipynbf), slides_dir)

        #copy the other files
        for of in others:
            of = op.realpath(of)
            if not op.exists(of):
                raise IOError('Could not find file {}'.format(of))

            if op.isdir(of):
                shutil.copytree(of, op.join(slides_dir, op.basename(of)))
            else:
                shutil.copy(of, slides_dir)

        #change dir and serve
        os.chdir(slides_dir)
        nbviewer_cmd = 'ipython nbconvert {} --to slides --post serve '
        nbviewer_cmd += '--config slides_config.py '
        nbviewer_cmd = nbviewer_cmd.format(ipynbf)

        log.info('Running: {}'.format(nbviewer_cmd))

        subprocess.check_call(nbviewer_cmd, shell=True)
    finally:
        os.chdir(cur_dir)
        shutil.rmtree(tmp_dir)
