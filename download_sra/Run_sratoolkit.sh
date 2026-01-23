#!/bin/bash
#SBATCH --job-name=BacSCAN
#SBATCH --time=72:00:00      # Walltime (HH:MM:SS)
#SBATCH --mem=50GB          # Memory in MB
#SBATCH --cpus-per-task=10
#SBATCH --array=0-6
#SBATCH --account=uc04105
#SBATCH --output=slurm_sra/sra_output%A-%a.out
#SBATCH --error=slurm_sra/sra_error%A-%a.err

#the file containing the acession sra has been split into 6 files
declare -a array=(1 2 3 4 5 6)
module load sratoolkit/3.0.2
ACCESSION_LIST=/nesi/nobackup/uc04105/cross_biome_metagenome/raw_data/water/SAR/SRR_table${array[$SLURM_ARRAY_TASK_ID]}.txt


# Check if the accessions file exists
if [ ! -f "$ACCESSION_LIST" ]; then
    echo "Error: Accession list file not found!"
    exit 1
fi

# Loop through the accessions and run fasterq-dump
while read SRR_ID; do
    echo "Starting download and conversion for $SRR_ID"
    fasterq-dump $SRR_ID --threads 8
    echo "Finished $SRR_ID"
done < "$ACCESSION_LIST"
