#!/bin/bash


longest_ins=""
longest_ins_len=0
longest_del=""
longest_del_len=0
target_ins_chr="1"
target_del_chr="2"

while IFS=$'\t' read -r -a line; do
    
    [[ ${line[0]} =~ ^# ]] && continue
    
    chr=${line[0]}
    ref=${line[3]}
    alt=${line[4]}
    
    
    if [[ ${#ref} -lt ${#alt} ]]; then
        
        if [[ $chr == $target_ins_chr ]]; then
            ins_len=$((${#alt} - ${#ref}))
            if (( ins_len > longest_ins_len )); then
                longest_ins_len=$ins_len
                longest_ins=${alt:${#ref}}
            fi
        fi
    elif [[ ${#ref} -gt ${#alt} ]]; then
        
        if [[ $chr == $target_del_chr ]]; then
            del_len=$((${#ref} - ${#alt}))
            if (( del_len > longest_del_len )); then
                longest_del_len=$del_len
                longest_del=$ref
            fi
        fi
    fi
done < ~/clinvar_20250330.vcf 

echo "Longest insertion: $longest_ins" >> fout
echo "Longest deletion: $longest_del" >> fout
