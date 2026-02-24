#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Bac_Beta_round2
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB2/Bac2Beta_%A-%a.err
#SBATCH --output        slurm_outputB2/Bac2Beta_%A-%a.out
#SBATCH --array         0-61
declare -a array=($(seq 0 61))
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/second_round/mmseqs/bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/initial_round/merged_all_three_domains


#----------------------------------------------------------MIP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_merged.fasta ${Bac_db} ${MMseqs}/PF00230_MIPmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00230_MIPmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00230_MIPmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#----------------------------------------------------------ClCA-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00654_ClcA_merged.fasta ${Bac_db} ${MMseqs}/PF00654_ClcAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00654_ClcAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00654_ClcAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------MscS-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00924_MscS_merged.faa ${Bac_db} ${MMseqs}/PF00924_MscSmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00924_MscSmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00924_MscSmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------Na_alanine_symporter-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01235_Na_alanine_symporter_merged.fasta ${Bac_db} ${MMseqs}/PF01235_Na_alanine_symportermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01235_Na_alanine_symportermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01235_Na_alanine_symportermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------CorA-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01544_CorA_merged.faa ${Bac_db} ${MMseqs}/PF01544_CorAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01544_CorAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01544_CorAmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------Ca_exchanger-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01699_Ca_exchanger_merged.faa ${Bac_db} ${MMseqs}/PF01699_Ca_exchangermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01699_Ca_exchangermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01699_Ca_exchangermerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#--------------------------------------------------------MscL-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01741_MscL_merged.faa ${Bac_db} ${MMseqs}/PF01741_MscLmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01741_MscLmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01741_MscLmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------KdP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03814_Kdp_merged.faa ${Bac_db} ${MMseqs}/PF03814_Kdpmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03814_Kdpmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF03814_Kdpmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------OpuAC-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04069_OpuAC_merged.fasta ${Bac_db} ${MMseqs}/PF04069_OpuACmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04069_OpuACmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF04069_OpuACmerged_vsBacteria${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

