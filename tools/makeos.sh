#!/bin/sh

WORKDIR="$HOME/src/github.com/dondakeshimo/OS12step"
USBDEV="/dev/tty.usbserial-FT1Y6SYF"

case $1 in
    make)
        docker run -i -v=$WORKDIR:/work -w=/work/src/$2 os12step make
        ;;

    image)
        docker run -i -v=$WORKDIR:/work -w=/work/src/$2 os12step make image
        ;;

    write)
        $WORKDIR/tools/kz_h8write -3069 -f20 $WORKDIR/src/$2/kzload.mot $USBDEV
        ;;

    clean)
        docker run -i -v=$WORKDIR:/work -w=/work/src/$2 os12step make clean
        ;;

esac
