#!/bin/sh
# for cygwin
cd /cygdrive/f/tdiarytheme

echo search .orig file
for prc in `find .|grep orig`
do
	echo remove $prc
	rm -f $prc
done
