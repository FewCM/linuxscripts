#!/bin/sh

if ! mpc status | grep -q "playing"; then
    echo " 喇 "
else
    echo "  "
fi
