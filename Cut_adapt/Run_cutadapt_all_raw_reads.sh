#!/bin/bash -e

#SBATCH --account       uc04105
#SBATCH --job-name      Cutadapt
#SBATCH --time          48:00:00
#SBATCH --mem           10GB
#SBATCH --cpus-per-task 5
#SBATCH --error         slurm_cutadapt/cut_%A-%a.err
#SBATCH --output        slurm_cutadapt/cut_%A-%a.out
#SBATCH --array         1-5

declare -a array=($(seq 0 5))

module load cutadapt/5.2-foss-2023a-Python-3.11.6


#input file to run cut adapt
paired=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/raw_data/water/SAR/paired_reads
single=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/raw_data/water/SAR/single_reads
outdir=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired

#mkdir ${outdir}/set_${array[$SLURM_ARRAY_TASK_ID]}
newdir=${outdir}/set_${array[$SLURM_ARRAY_TASK_ID]}
for R1 in ${paired}/set_${array[$SLURM_ARRAY_TASK_ID]}/*_1.fastq; do
    R2=${R1/_1.fastq/_2.fastq}
    part1=${R1%_1.fastq}
    basename=${part1##*/}
    cutadapt -o ${newdir}/${basename}_1_cutadapted.fastq -p ${newdir}/${basename}_2_cutadapted.fastq ${R1} ${R2} --cores 5

done

