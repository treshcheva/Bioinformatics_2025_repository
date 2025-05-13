#!/bin/bash
#SBATCH --job-name=fastp
#SBATCH --output=fastp_%j.log
#SBATCH --error=fastp_%j.err
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G

module load fastp

fastp -i /projects/mipt_dbmp_biotechnology/rnaseq_map_star/raw_data/Eg_Treg_S71_R1_001.fastq.gz -I /projects/mipt_dbmp_biotechnology/rnaseq_map_star/raw_data/Eg_Treg_S71_R2_001.fastq.gz -o Eg_Treg_S71_R1_trimmed.fastq.gz -O Eg_Treg_S71_R2_trimmed.fastq.gz --html fastp_report.html --detect_adapter_for_pe --trim_poly_g --qualified_quality_phred 20 --length_required 50
