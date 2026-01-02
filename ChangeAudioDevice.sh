#!/bin/bash

# User experience
pactl list sinks | grep -A 3 'Sink #[[:digit:]]' | sed '/State: /d;/Name:/d;s/Description: //g'

echo -e "\n------------------------------"
read -p "Enter your Sink ID: " sink
echo "------------------------------"

pactl list sink-inputs | grep -e 'Sink Input #[[:digit:]]' -e "application.name = "

echo -e "\n------------------------------"
read -p " Enter your Sink Input ID: " sink_input
echo "------------------------------"

pactl move-sink-input $sink_input $sink
echo "Output device changed."
