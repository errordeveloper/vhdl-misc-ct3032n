#!/bin/tcsh -f

sed '/^--.*$/d' $argv | sed 's/--.*$//'
