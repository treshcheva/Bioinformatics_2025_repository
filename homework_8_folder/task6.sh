#!/bin/bash

total_chars=0

while IFS= read -r line; do
    line_content=$(echo "$line" | tr -d '\n')
    
    if [[ "$line_content" =~ [0-9] ]] && 
       ! [[ "$line_content" =~ [XxYy] ]]; then
      
        chars=$(echo -n "$line_content" | wc -m)
        total_chars=$((total_chars + chars))
    fi
done < ~/homeworks/hw_8/hw8_files/6/6.1/fin

echo "$total_chars" >> fout
