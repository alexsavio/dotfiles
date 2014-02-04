#!/usr/bin/env python

import os
import sys
import subprocess

env_root = os.getenv('VIRTUAL_ENV')

if sys.platform == 'win32':
    bin = 'Scripts'
else:
    bin = 'bin'

class Piper(object):

    def __init__(self, pip_path):
        self._pip_path = pip_path

    @staticmethod
    def _check_output(args=[]):
        return subprocess.check_output(args).split()

    @staticmethod
    def _exec_comm(args=[]):
        return subprocess.call(args)

    @staticmethod
    def _append_to_comm(comm, args):
        if isinstance(comm, str):
            comm = [comm]

        if isinstance(args, list):
            comm.extend(args)
        elif isinstance(args, str):
            comm.append(args)

        return comm

    def _pip_exec(self, args, modules=[]):
        pip_comm = self._pip_path
        pip_comm = self._append_to_comm(pip_comm, args)
        pip_comm = self._append_to_comm(pip_comm, modules)
        print('Executing: ' + ' '.join(pip_comm))
        self._exec_comm(pip_comm)

    def install(self, modules=[]):
        self._pip_exec('install', modules)

    def upgrade(self, modules=[]):
        self._pip_exec(['install', '-U'], modules)

    def freeze(self):
        return self._check_output([self._pip_path, 'freeze'])

if __name__ == '__main__':
    mypip = Piper(os.path.join(env_root, bin, 'pip'))
    env_packages = mypip.freeze()

    for pck in env_packages:
        pck_name = pck.split('==')[0]
        mypip.upgrade(pck_name)

