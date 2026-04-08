#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      NEW_test
#SBATCH --time          44:00:00
#SBATCH --mem           30GB
#SBATCH --cpus-per-task 15
#SBATCH --error         slurm_xblastoutput/Bacscan_%A-%a.err
#SBATCH --output        slurm_xblastoutput/Bacscan_%A-%a.out
#SBATCH --array         0-47%47
declare -a array=($(seq 0 47))

ID_LIST=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Missing_list_Apr3.txt
Line_number=${array[$SLURM_ARRAY_TASK_ID]}
DB=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/sequences/Salt_resistance_database_18March_DB.faa.dmnd
XBLAST=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/DNA/xlbast_output
# Loop through the accessions and run fasterq-dump
module load sratoolkit/3.0.2
module load DIAMOND/2.0.15-GCC-11.3.0

SRR_ID=SRR25522578
#echo "${Line_number} ${SRR_ID}"

module load sratoolkit/3.0.2
module load DIAMOND/2.0.15-GCC-11.3.0

cd /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/DNA/xlbast_output

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
#rm $SRR_ID*.fastq
