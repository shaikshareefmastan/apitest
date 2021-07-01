#!/bin/bash
baseversion=$(cat patch)
first_dig=$(cat majorversion)
sec_dig=$(cat revision)
count=$((sec_dig+1));
echo $count
echo $sec_dig
sed -i 's/$sec_dig/$count' revision
