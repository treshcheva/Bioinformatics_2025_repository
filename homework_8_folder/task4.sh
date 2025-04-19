#!/bin/bash

while read -r name; do
    read -r ticket

  
    if [[ "$ticket" == *"777"* ]]; then
        
        echo "$name" >> fout
        echo "$ticket" >> fout
    fi
done < ~/homeworks/hw_8/hw8_files/4/fin
