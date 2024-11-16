#!/bin/sh

xkb_layout=$(xkb-switch -p)

if [ "$xkb_layout" = "us" ]; then
    echo ""
elif [ "$xkb_layout" = "ru" ]; then
    echo ""
fi
