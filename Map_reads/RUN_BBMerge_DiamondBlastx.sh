#!/bin/bash -e

#SBATCH --account       uc04105
#SBATCH --job-name      Cutadapt
#SBATCH --time          48:00:00
#SBATCH --mem           10GB
#SBATCH --cpus-per-task 5
#SBATCH --error         slurm_diamond/dia_%A-%a.err
#SBATCH --output        slurm_diamond/dia_%A-%a.out
#SBATCH --array         1-5

declare -a array=($(seq 0 5))


module load BBMap/39.01-GCC-11.3.0
module load Python-Geo/3.11.3-gimkl-2022a

db=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/Adriaansens_CPA/CPA/CPA_database_diamond.dmnd

paired_cutdapt=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired

outdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Mapping_reads

for R1 in /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_${array[$SLURM_ARRAY_TASK_ID]}/*1_cutadapted.fastq; do
    R2=${R1/_1_cutadapted.fastq/_2_cutadapted.fastq}
    part1=${R1%_1_cutadapted.fastq}
    basename=${part1##*/}
    bash bbmerge.sh in1=${R1} in2=${R2} out=/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_${array[$SLURM_ARRAY_TASK_ID]}/${basename}_bbmerged.fna t=5
    python fastqcount.py ${R1}
    python fastqcount.py ${R2}
    python fastqcount.py /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_${array[$SLURM_ARRAY_TASK_ID]}/${basename}_bbmerged.fna
done



module purge
module load DIAMOND/2.1.14-GCC-12.3.0
for R1 in /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_${array[$SLURM_ARRAY_TASK_ID]}/*1_cutadapted.fastq; do
    R2=${R1/_1_cutadapted.fastq/_2_cutadapted.fastq}
    part1=${R1%_1_cutadapted.fastq}
    basename=${part1##*/}
    diamond blastx -p 5 -d ${db} -q /nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/paired/set_${array[$SLURM_ARRAY_TASK_ID]}/${basename}_bbmerged.fna -o ${outdir}/${basename}_bbmerged_matches_CPA.m8
    diamond blastx -p 5 -d ${db} -q ${R1} -o ${outdir}/${basename}_1_matches_CPA.m8
    diamond blastx -p 5 -d ${db} -q ${R2} -o ${outdir}/${basename}_2_matches_CPA.m8
done
