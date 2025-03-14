#!/bin/bash

BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
STATUS=$(acpi -b | awk '{print $3}' | tr -d ',')

if [[ "$STATUS" == "Discharging" && "$BATTERY_LEVEL" -le 15 ]]; then
    dunstify -u critical "Low Battery" "Battery at $BATTERY_LEVEL%! Plug in the charger."
fi
