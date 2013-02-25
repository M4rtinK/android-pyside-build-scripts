#!/bin/bash

source ../env.sh

STRIP="${STRIP} -v -s"

find stage | xargs file | grep "shared object" | grep ELF | awk -F: '{print $1}' | xargs -d'\n' -r $STRIP
