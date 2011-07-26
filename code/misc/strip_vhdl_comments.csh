#!/bin/tcsh -f

sed '/^--.*$/d' $argv | sed 's/\ --.*$//' | sed 's/\t--.*$//'

