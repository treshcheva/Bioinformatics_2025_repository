#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --output=fastqc_%j.log
#SBATCH --error=fastqc_%j.err
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G

fastqc /projects/mipt_dbmp_biotechnology/rnaseq_map_star/raw_data/Eg_Treg_S71_R{1,2}_001.fastq.gz -o ./fastqc_raw

fastqc Eg_Treg_S71_R{1,2}_trimmed.fastq.gz -o ./fastqc_trimmed
