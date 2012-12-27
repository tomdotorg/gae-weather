#!/bin/bash

#echo "running wunder-almanac.sh"

# assume run from rails root (~/apps/wx-services/current)

./script/runner lib/wunder_almanac.rb
