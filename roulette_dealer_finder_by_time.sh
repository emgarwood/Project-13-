#! /bin/bash
echo "What time are you looking for?(00)"
read time
echo "What date are you looking for(0000, * for every day)"
read date 
grep -w $time find $date*
