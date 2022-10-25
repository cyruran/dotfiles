#!/bin/bash

type=$1

output=$(/usr/sbin/rfkill list -no SOFT $type)

if [[ $output == "blocked
blocked" || $output == "blocked" ]]; then
    status=blocked
    color=red
elif [[ $output == "unblocked
unblocked" || $output == "unblocked" ]]; then
    status=unblocked
    color=green
else
    status=mixed
    color=yellow
fi

if [[ $BLOCK_BUTTON == "1" ]]; then
    case "$status" in
        mixed|unblocked)
            sudo rfkill block $type
            ;;
        *)
            sudo rfkill unblock $type
            ;;
    esac
    BLOCK_BUTTON="" $0 $type
else
    echo "$type: <span color=\"$color\">$status</span>"
fi
