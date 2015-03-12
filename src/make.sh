#!/bin/sh

# for cygwin
cd /cygdrive/f/tdiarytheme

# make Makefile
perl makemakefile.pl > Makefile

# make
make -j 4
make -j 4
