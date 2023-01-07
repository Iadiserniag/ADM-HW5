#!/bin/bash

# We suggest running these commands on the clean dataset after preprocessing

#1. Most popular pair of heroes

echo 'The most popular pair of heros is:'
cut -d, -f1,2 hero-network.csv | sort | uniq -c | sort -nr | head -n 1
#there are some outputs that dont come in pairs. Head 11 is the correct one

#2. Number of comics per hero.

echo " "
echo 'The number of comics per hero is:'
cut -d, -f1 edges.csv | sort | uniq -c | sort -nr

#3. Average comics per hero:
echo " "
echo 'The average number of heroes per comic is:'
awk -F"," -v OFMT='%.2f' '{a[$2]+=1}END{for(i in a) print i,a[i]}' edges.csv | sort -n