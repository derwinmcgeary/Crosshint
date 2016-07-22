#!/bin/bash

# This ~incredibly useful~ script takes two parameters: a regex in the form of ^a..a.$ and a letter position
# this is intended to help make intelligent guesses about partially solved crosswords
# it outputs a histogram of letters at that position
# If you're reading this, give me a shout at @derwinmcgeary

if [ $# -lt 1 ]
then
    echo "Usage: crosshist.sh ..adac.. 1 (to get a hint for letter 1)"
    echo "       crosshist.sh he....he (to get a list of matching words)"
    echo "       use . to stand  for any unknown letters"
    exit
fi

if [ $# -eq 2 ]
then
    
    tf=`mktemp`
    patt=^${1}\$
    
    sed -e "s/[-\']//g" /usr/share/dict/words| uniq | grep ${patt} | cut -b ${2} > ${tf}
    
    for letter in {a..z}
    do
	x=`grep ${letter} ${tf} | wc -l`
	if [ $x -ne 0 ]; then
	    printf $letter%.0s $(seq 1 ${x});
	    echo
	fi
    done
    
    rm ${tf}
fi

if [ $# -eq 1 ]
then
    patt=^${1}\$

    sed -e "s/[-\']//g" /usr/share/dict/words | uniq | grep ${patt}
fi
