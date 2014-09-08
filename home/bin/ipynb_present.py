#!/usr/bin/env python

import os
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
        exit(-1)

    ipynbf = args.notebook
    others = args.others

    if not os.path.exists(ipynbf):
        log.error('Could not find file: {}'.format(ipynbf))
        exit(-1)

    cur_dir = os.path.abspath(os.curdir)

    #check for 'statics 'templates' dir
    ipynb_path = os.path.dirname(os.path.realpath(ipynbf))
    statics_dir = os.path.join(ipynb_path, 'templates')
    if not os.path.exists(statics_dir):
        statics_dir = os.path.expanduser('~/Dropbox/Documents/ipynb/templates')

    if os.path.exists(statics_dir):
        log.info('Using templates folder from: {}'.format(statics_dir))

    #create temporary folder
    tmp_dir = tempfile.mkdtemp(prefix='ipynb_present_')

    #work in non-existent folder within the tmp_dir so shutil.copytree can work
    log.info('ipynb_present.py: Working on temp dir {}'.format(tmp_dir))
    slides_dir = os.path.join(tmp_dir, 'slides')

    try:
        #copy templates contents
        if os.path.exists(statics_dir):
            shutil.copytree(statics_dir, slides_dir)
        else:
            slides_dir = tmp_dir

        #copy the ipynb file
        shutil.copy(os.path.realpath(ipynbf), slides_dir)

        #copy the others files
        for of in others:
            if not os.path.exists(of):
                msg = 'Could not find file {}'.format(of)
                log.error(msg)
                raise IOError(msg)

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

