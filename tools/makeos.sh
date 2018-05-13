#!/bin/sh

case $1 in
  make)  docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make;;
  image) docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make image;;
  write) docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make write;;
  clean)  docker run -i -v=/Users/taku/OS12step:/work -w=/work/src/$2 os12step make clean;;
esac
