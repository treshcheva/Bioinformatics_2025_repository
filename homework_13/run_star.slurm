#!/bin/bash
#SBATCH --job-name=star
#SBATCH --output=star_%j.log
#SBATCH --error=star_%j.err
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task=12
#SBATCH --mem=32G

module load star

STAR --genomeDir /projects/mipt_dbmp_biotechnology/GRCh38/  --readFilesIn Eg_Treg_S71_R1_trimmed.fastq.gz Eg_Treg_S71_R2_trimmed.fastq.gz --readFilesCommand zcat --runThreadN $SLURM_CPUS_PER_TASK --outSAMtype BAM SortedByCoordinate  --quantMode GeneCounts --outFileNamePrefix Eg_Treg_S71_  --outFilterType BySJout --outFilterMultimapNmax 20
