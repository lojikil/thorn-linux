#!/bin/bash

cd /usr/share/cuckoo
terminator -e 'sudo ./cuckoo.py; bash -l'
