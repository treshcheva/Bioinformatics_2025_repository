#!/bin/bash

sum=$(awk '{print $1 + $2 + $3}' ~/homeworks/hw_8/hw8_files/1/fin)
echo $sum >> fout 
