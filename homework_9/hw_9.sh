mkdir -p data/raw data/clean reports/fastqc reports/multiqc logs

echo "Downloading SRA data..."
ids=("ERR14230570" "ERR14230582" "ERR14230586" "ERR14230595")

for id in "${ids[@]}"; do
    echo "Processing $id..."
    prefetch "$id" && \
    fasterq-dump --outdir data/raw "$id"
done 

echo "Checking FASTQ files..."
if ! ls data/raw/*.fastq 1> /dev/null 2>&1; then
    echo "No FASTQ files found! Exiting."
    exit 1
fi

echo "Running FastQC..."
fastqc -t $SLURM_CPUS_PER_TASK -o reports/fastqc data/raw/*.fastq

echo "Generating MultiQC report..."
multiqc -o reports/multiqc reports/fastqc/

echo "Analysis complete! Check reports/multiqc/"
