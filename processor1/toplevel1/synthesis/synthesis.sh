#!/bin/bash

rm -rf xst

echo "xst -ifn "toplevel1_xst.scr" -intstyle silent"

echo "Running XST synthesis ..."

xst -ifn "toplevel1_xst.scr" -intstyle silent
if [ $? -ne 0 ]; then
  exit 1
fi

echo "XST completed"

rm -rf xst

mv ../implementation/toplevel1.ngc .
ngcbuild ./toplevel1.ngc ../implementation/toplevel1.ngc -sd ../implementation -i
if [ $? -ne 0 ]; then
  exit 1
fi
