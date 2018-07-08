#!/bin/bash

str_date=$(date +"%Y_%m_%d")
dumpfolder="/data/db/dump/$str_date"
current_database_name=listvytsia_development
production_database_name=listvytsia_production

echo "$dumpfolder/$production_database_name"
mongorestore --db $current_database_name \
             --drop "$dumpfolder/$production_database_name"
