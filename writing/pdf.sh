#!/bin/sh
# 
# pdf.sh:  make pdf from markdown source, with decent settings for
# using greek.
#
# usage: pdf.sh BASE_NAME
#
# where the input is in BASE_NAME.md. Output will be in BASE_NAME.pdf.


export PANDOC=`which pandoc`
if [ $# -eq 1 ] 
then
    $PANDOC $1.md -o $1.pdf --latex-engine=xelatex --variable mainfont="Gentium"
else 
     echo "Usage:  pdf.sh BASE_NAME"
fi
