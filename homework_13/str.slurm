#!/bin/bash
#SBATCH --job-name=stringtie
#SBATCH --output=stringtie_%j.log
#SBATCH --error=stringtie_%j.err
#SBATCH --time=3:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G

module load stringtie

samtools view -H Eg_Treg_S71_Aligned.sortedByCoord.out.bam | grep -q 'SO:coordinate' || {
  echo "BAM not sorted! Re-sorting..."
  samtools sort -@ $SLURM_CPUS_PER_TASK -o Eg_Treg_S71_Aligned.resorted.bam Eg_Treg_S71_Aligned.sortedByCoord.out.bam
  INPUT_BAM="Eg_Treg_S71_Aligned.resorted.bam"
} || INPUT_BAM="Eg_Treg_S71_Aligned.sortedByCoord.out.bam"

stringtie $INPUT_BAM  -G /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.110.chr.gtf -o Eg_Treg_S71_transcripts.gtf  -p $SLURM_CPUS_PER_TASK -l Eg_Treg_S71
