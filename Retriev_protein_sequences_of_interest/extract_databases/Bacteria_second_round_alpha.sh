#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Bac_Alpha_round2
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB2/Bac2Alpha_%A.err
#SBATCH --output        slurm_outputB2/Bac2Alpha_%A.out
#SBATCH --array         0-61
declare -a array=($(seq 0 61))
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/second_round/mmseqs/bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/initial_round/merged_all_three_domains

#------------------------------------------------------NhaB-------------------------------------------------------------------------6
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06450_NhaB_merged.faa ${Bac_db} ${MMseqs}/PF06450_NhaBmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06450_NhaBmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF06450_NhaBmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta


#----------------------------------------------------------Rps2-------------------------------------------------------------------------1
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00318_RpS2_merged.fasta ${Bac_db} ${MMseqs}/PF00318_RpS2merged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00318_RpS2merged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00318_RpS2merged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------TreT------------------------------------------------------------------------2
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF21269_TreT_merged.fasta ${Bac_db} ${MMseqs}/PF21269_TreTmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF21269_TreTmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF21269_TreTmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------NqrA------------------------------------------------------------------------3
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF24836_NqrA_merged.fasta ${Bac_db} ${MMseqs}/PF24836_NqrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF24836_NqrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------KimA------------------------------------------------------------------------4
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PTHR47704_KimA.fasta ${Bac_db} ${MMseqs}/PTHR47704_KimAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PTHR47704_KimAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------Betain_dehydrogenase------------------------------------------------------------------------5
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/TIGR01804.1_Betain-aldehyde_dehydrogenase_merged.faa ${Bac_db} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta


#--------------------------------------------------------MtrA-------------------------------------------------------------------------7
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04208_MtrA_merged.faa ${Bac_db} ${MMseqs}/PF04208_MtrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_Alpha_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04208_MtrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF04208_MtrAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

