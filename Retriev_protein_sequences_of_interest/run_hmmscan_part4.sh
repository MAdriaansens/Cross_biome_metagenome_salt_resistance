#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Bacscan
#SBATCH --time          102:00:00
#SBATCH --mem           20GB
#SBATCH --cpus-per-task 10
#SBATCH --error         slurm_output/Bacscan_%A-%a.err
#SBATCH --output        slurm_output/Bacscan_%A-%a.out
#SBATCH --array         0-127

module load HMMER/3.3.2-GCC-12.3.0

declare -a array=($(seq 0 127))

HMMDB=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM/Pfam_hmm_database/Pfam-A_plus2.hmm 
HMMalign=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMalign/Bacteria
HMMscan=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMscan/Bacteria


find ${HMMalign} -size 0 -print -delete

#this is done to remove any empty files, becuase you can not run a hmmscan on an empty file

for file in ${HMMalign}/*subset${array[$SLURM_ARRAY_TASK_ID]}_*.fasta; do
    base=$(basename "$file" .fasta)
    echo "$file"
    hmmscan -E 0.001 --cpu 10 \
        --tblout ${HMMscan}/${base}_HMMscanned.tsv \
        ${HMMDB} "$file"
done
