#!/bin/sh

status=$(apm)

battery_status=$(echo "$status" | rg "^Battery Status" | sed -e 's/^.*: //g')
ac_status=$(echo "$status" | rg "^AC Line status" | sed -e 's/^.*: //g')
battery_life=$(echo "$status" | rg "^Remaining battery life" | sed -E 's/[^0-9]//g')

full_battery="󰁹"
if [ "$battery_status" = "charging" ]; then
    full_battery="󰂄"
elif [ "$ac_status" = "on-line" ]; then
    full_battery="󱐋"
fi

capacity=""
for i in $(seq 90 -10 0); do
    if [ "$i" -lt "$battery_life" ]; then
        diff=$(("$battery_life" - "$i"))
        if [ "$diff" -gt 9 ]; then
            capacity="$capacity$full_battery"
        elif [ "$full_battery" != "󰁹" ]; then
            capacity="$capacity$full_battery"
        else
            if [ "$diff" -eq 1 ]; then
                capacity="$capacity󰁺"
            elif [ "$diff" -eq 2 ]; then
                capacity="$capacity󰁻"
            elif [ "$diff" -eq 3 ]; then
                capacity="$capacity󰁼"
            elif [ "$diff" -eq 4 ]; then
                capacity="$capacity󰁽"
            elif [ "$diff" -eq 5 ]; then
                capacity="$capacity󰁾"
            elif [ "$diff" -eq 6 ]; then
                capacity="$capacity󰁿"
            elif [ "$diff" -eq 7 ]; then
                capacity="$capacity󰂀"
            elif [ "$diff" -eq 8 ]; then
                capacity="$capacity󰂁"
            elif [ "$diff" -eq 9 ]; then
                capacity="$capacity󰂂"
            fi
        fi
    else
        capacity="$capacity󰂎"
    fi
done

echo "$capacity"
