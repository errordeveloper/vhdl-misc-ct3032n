#!/bin/csh

set temp=`mktemp -q /tmp/vim_session.XXXXXX`

zcat $argv[1] > $temp

vim -S $temp
