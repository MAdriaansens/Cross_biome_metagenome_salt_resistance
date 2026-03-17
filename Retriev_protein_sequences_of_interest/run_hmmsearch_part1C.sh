#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      BacC
#SBATCH --time          102:00:00
#SBATCH --mem           80GB
#SBATCH --cpus-per-task 20
#SBATCH --error         slurm_outputB/slurm_BacC_%A-%a.err
#SBATCH --output        slurm_outputB/slurm_BacC_%A-%a.out
#SBATCH --array         0-127
declare -a array=($(seq 0 127))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Bacteria
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences

module load HMMER/3.4-GCC-12.3.0
module load Python/3.11.3-gimkl-2022a

#---------------------------------------------------------ABC1----------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF05525_BRCAtranspoter1hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF05525_BRCAtranspoter1.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py  ${HMMsearch}/PF05525_BRCAtranspoter1hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV}  ${HMMsearch}/PF05525_BRCAtranspoter1hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------ABC2----------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF13520_BRCAtranspoter2hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF13520_BRCAtranspoter2.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF13520_BRCAtranspoter2hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF13520_BRCAtranspoter2hmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#--additional clean up
rm -r  ${HMMsearch}/*vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv
