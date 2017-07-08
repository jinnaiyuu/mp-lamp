#!/bin/bash

# TODO: choose which data to test
#cd ..
WDIR=/home/yuu/workspace/mp-lamp
INSTDIR=./samples/cont_data

instance=synth_50_10
class=synth_50_10
method="mahito"
method="jinnai-0.95"

if [ "1" = "1" ]
then
   INSTDIR=./samples/crystal
   instance=comb200
   class=material
fi

if [ $method = "mahito" ]
then
    echo "mpiexec -np 2 $WDIR/cont-lamp --item ${INSTDIR}/${instance}.data --pos ${INSTDIR}/${class}.class  --show_progress true --log true -discretize 0"
    mpiexec -np 2 $WDIR/cont-lamp --item ${INSTDIR}/${instance}.data --pos ${INSTDIR}/${class}.class  --show_progress true --log true -discretize 0
else
    mpiexec -np 2 $WDIR/cont-lamp --item ${INSTDIR}/${instance}.data --pos ${INSTDIR}/${class}.class  --show_progress true --log true -discretize 1 -ratio 0.95
fi

