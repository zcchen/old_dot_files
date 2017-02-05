#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import subprocess

current_dir = os.path.abspath(os.path.dirname(__file__))

procs = []
for d in os.listdir(current_dir):
    work_d = os.path.join(current_dir, d)
    if os.path.isdir(work_d):
        procs.append(\
                subprocess.Popen(['git', 'pull'],
                    shell=False,
                    cwd=work_d,
                    stderr=subprocess.PIPE,
                    stdout=subprocess.PIPE)
            )

try:
    while procs:
        for p in procs:
            # print(p.poll(), procs)
            if p.poll() is None:
                p.wait()
            else:
                procs.remove(p)
    print('Well done')
except KeyboardInterrupt:
    for p in procs:
        try:
            p.terminate()
        except:
            import traceback
            traceback.print_exc()
    print('\nTerminated by user')

