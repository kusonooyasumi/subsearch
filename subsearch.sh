#! /bin/bash

echo "domain"
read domain
echo "file tag"
read tag

crtsh_scan() {
  curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

assetfinder $domain > $tags.subs.txt
subfinder -d $domain >> $tags.subs.txt
sublist3r -d $domain >> $tags.subs.txt
crtsh_scan $domain >> $tags.subs.txt
