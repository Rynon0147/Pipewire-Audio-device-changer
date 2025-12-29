#!/bin/bash

# Store in Arrays
#sinks_arr=()
#mapfile -t sinks < <(pactl list sinks | grep 'Sink #[[:digit:]]' | sed -n -e 's/.*Sink #\([[:digit:]]\)/\1/p')
#sink_in_arr=()
#mapfile -t sinks < <(pactl list sink-inputs | sed -n -e 's/.*Sink Input #\([[:digit:]]\)/\1/p')

#for i in "${!sinks[@]}"; do

#done

# User experience
pactl list sinks | grep -A 3 'Sink #[[:digit:]]' | sed '/State: /d;/Name:/d;s/Description: //g'

echo -e "\n------------------------------"
read -p "Enter your Sink ID: " sink
echo "------------------------------"

pactl list sink-inputs | grep -e 'Sink Input #[[:digit:]]' -e "application.name = "| sed '/./{N; /application\.name = /!d;s/application\.name = "//; s/"//;}'

echo -e "\n------------------------------"
read -p " Enter your Sink Input ID: " sink_input
echo "------------------------------"

pactl move-sink-input $sink_input $sink
echo "Output device changed."
