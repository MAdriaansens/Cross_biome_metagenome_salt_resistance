#!/bin/bash -e

#SBATCH --account       uc04105
#SBATCH --job-name      5Diamond
#SBATCH --time          48:00:00
#SBATCH --mem           60GB
#SBATCH --cpus-per-task 10
#SBATCH --error         slurm_diamond/dia_5%A-%a.err
#SBATCH --output        slurm_diamond/dia_5%A-%a.out
#SBATCH --array         0-6

declare -a array=($(seq 1 6))


module load BBMap/39.01-GCC-11.3.0
module load Python-Geo/3.11.3-gimkl-2022a

db=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/Adriaansens_CPA/CPA/CPA_database_diamond.dmnd

paired_cutdapt=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired

outdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Mapping_reads

for R1 in /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_ ${array[$SLURM_ARRAY_TASK_ID]}/*1_cutadapted.fastq; do
    R2=${R1/_1_cutadapted.fastq/_2_cutadapted.fastq}
    part1=${R1%_1_cutadapted.fastq}
    basename=${part1##*/}

    bash bbmerge.sh in1=${R1} in2=${R2} out=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_ ${array[$SLURM_ARRAY_TASK_ID]}/${basename}_bbmerged.fna t=10
    python fastqcount.py ${R1}
    python fastqcount.py ${R2}
    python fastqcount.py /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_ ${array[$SLURM_ARRAY_TASK_ID]}/${basename}_bbmerged.fna
done
