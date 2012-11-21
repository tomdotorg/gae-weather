#!/bin/bash

# echo "running noaa.sh"
export RAILS_ENV=production
cd ~/apps/wx-services/current


./script/custom/wunder-forecast.sh
./script/custom/wunder-conditions.sh

