#!/bin/bash

for file in ~/homeworks/hw_2/*.tsv ; do
        file_name=$(basename "$file"|cut -d. -f1)
        mkdir "$file_name"
	mv "$file" "$file_name/"
done
