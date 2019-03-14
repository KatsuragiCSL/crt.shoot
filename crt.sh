#!/bin/bash

domain=$1
curl "https://crt.sh/?q=%25.$domain" | grep "$domain" | awk 'BEGIN{FS="<TD>"} {print $2}' | awk 'BEGIN{FS="</TD>"} {print $1}' > $domain.txt
sort -u -o $domain.txt $domain.txt

#remove the star at the beginning
cat $domain.txt | grep -E '\*' | awk -F'.' -v OFS='.' '{print $2,$3}' > "$domain.to_brute.txt"
