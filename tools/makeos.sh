#!/bin/sh

case $1 in
  make)  docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make;;
  image) docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make image;;
  write) /Users/taku/OS12step/tools/kz_h8write -3069 -f20 /Users/taku/OS12step/src/$2/kzload.mot /dev/tty.usbserial-FT1Y6SYF;;
  clean) docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make clean;;
esac
