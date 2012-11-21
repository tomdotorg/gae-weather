#!/bin/bash

# echo "running noaa.sh"
export RAILS_ENV=production
cd ~/apps/wx-services/current


./script/custom/noaa-conditions.sh
./script/custom/noaa-forecast.sh
