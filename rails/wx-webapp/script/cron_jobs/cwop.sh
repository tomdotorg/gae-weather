#!/bin/bash

#echo "running cwop.sh"

. `/home/tom/.rvm/bin/rvm env --path -- ree`

cd ~/apps/wx-services/current

export RAILS_ENV=production

./script/custom/cwop.sh

