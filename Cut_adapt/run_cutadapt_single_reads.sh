#!/bin/bash -e

#SBATCH --account       uc04105
#SBATCH --job-name      Cutadapt
#SBATCH --time          48:00:00
#SBATCH --mem           10GB
#SBATCH --cpus-per-task 5
#SBATCH --error         slurm_cutadapt/cut_single_%A-%a.err
#SBATCH --output        slurm_cutadapt/cut_single_%A.out


module load cutadapt/5.2-foss-2023a-Python-3.11.6


single=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/raw_data/water/SAR/single_reads
outdir=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/single

for file in ${single}/*.fastq; do
    part1=${file%.fastq}
    basename=${part1##*/}
    cutadapt -o ${outdir}/${basename}_cutadapted.fastq ${file} --cores 5

done
