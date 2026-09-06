#!/bin/bash -e
#SBATCH --job-name      Diamond_test
#SBATCH --time          24:00:00
#SBATCH --mem           70GB
#SBATCH --cpus-per-task 15
#SBATCH --exclude=n[13-15]
#SBATCH --error         slurm_xblastoutput/BacscanR_%A-%a.err
#SBATCH --output        slurm_xblastoutput/BacscanR_%A-%a.out
#SBATCH --array         0-566
declare -a array=($(seq 0 566))

ID_LIST=/home/mad149/chapter_meta_analysis/Aquatic_SRR_ids.txt
Line_number=${array[$SLURM_ARRAY_TASK_ID]}
DB=/home/mad149/chapter_meta_analysis/Protein/salt_resistance_database.dmnd
XBLAST=/home/mad149/chapter_meta_analysis/xblastoutput
# Loop through the accessions and run fasterq-dump

SRR_ID=$(head -n ${array[$SLURM_ARRAY_TASK_ID]} ${ID_LIST} | tail -n1)

echo ${SRR_ID}

module load SRA-Toolkit/3.0.10-gompi-2023a
module load DIAMOND/2.1.8-GCC-12.3.0
cd /home/mad149/chapter_meta_analysis/xblastoutput

fasterq-dump $SRR_ID --threads ${SLURM_CPUS_PER_TASK}

files=(${SRR_ID}*fastq )

echo ${#files[@]}

if [[ ${#files[@]} -eq 2 ]]; then
    echo "no issues, continue to run xblast"
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001  --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}_1.fastq --out ${SRR_ID}_1_vs_Salt_DB.m8
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001 --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}_2.fastq --out ${SRR_ID}_2_vs_Salt_DB.m8
elif [[ ${#files[@]} -eq 1 ]]; then
    echo "${SRR_ID} is not paired"
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001 --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}.fastq --out ${SRR_ID}_3_vs_Salt_DB.m8
elif [[ ${#files[@]} -eq 3 ]]; then
    echo "${SRR_ID} is triple"
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001  --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}_1.fastq --out ${SRR_ID}_1_vs_Salt_DB.m8
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001 --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}_2.fastq --out ${SRR_ID}_2_vs_Salt_DB.m8
    diamond blastx --threads ${SLURM_CPUS_PER_TASK} --evalue 0.00001 --max-target-seqs 1 --outfmt 6 qseqid sseqid slen evalue bitscore qseq qseq_translated --db ${DB} -q ${SRR_ID}.fastq --out ${SRR_ID}_3_vs_Salt_DB.m8
else
    echo "${SRR_ID} gives issues"
fi
echo "Finished $SRR_ID, running clean up"
rm $SRR_ID*.fastq
