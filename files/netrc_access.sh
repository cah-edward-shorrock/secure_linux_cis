#!/bin/bash
< /etc/passwd egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.netrc; do
    if [ ! -h "$file" -a -f "$file" ]; then
      fileperm=$(ls -ld $file | cut -f1 -d" ")
      if [ "$(echo "$fileperm" | cut -c5)"  != "-" ]; then
        echo "Group Read set on $file"
      fi
      if [ "$(echo "$fileperm" | cut -c6)"  != "-" ]; then
        echo "Group Write set on $file"
      fi
      if [ "$(echo "$fileperm" | cut -c7)"  != "-" ]; then
        echo "Group Execute set on $file"
      fi
      if [ "$(echo "$fileperm" | cut -c8)"  != "-" ]; then
        echo "Other Read set on $file"
      fi
      if [ "$(echo "$fileperm" | cut -c9)"  != "-" ]; then
        echo "Other Write set on $file"
      fi
      if [ "$(echo "$fileperm" | cut -c10)"  != "-" ]; then
        echo "Other Execute set on $file"
      fi
    fi
  done
done
