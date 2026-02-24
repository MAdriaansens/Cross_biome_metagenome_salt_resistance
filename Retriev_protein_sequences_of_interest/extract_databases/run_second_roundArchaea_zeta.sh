#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Arc_Zeta_round2
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB2/Bac2Zeta_%A-%a.err
#SBATCH --output        slurm_outputB2/Bac2Zeta_%A-%a.out
#SBATCH --array         0-12
declare -a array=($(seq 0 12))
Arc_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Archaea_GTDB226_protein_May92025.tsv
Arc_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/ARCDB/fasta/Archaea_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/second_round/mmseqs/archaea
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/initial_round/merged_all_three_domains



#----------------------------------------------------------RpL4-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF00573_RpL4_merged.fasta ${Arc_db} ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta


#--------------------------------------------------------MgtE-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF01769_MgtE_merged.faa ${Arc_db} ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#--------------------------------------------------------MnhE-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF01899_MnhE_merged.fasta ${Arc_db} ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------BCCT-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF02028_BCCT_merged.fasta ${Arc_db} ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta
#-------------------------------------------------------OtsB-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF02358_OtsB_merged.fasta ${Arc_db} ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------TrkH-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF02386_TrkH_merged.faa ${Arc_db} ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------Kup-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF02705_Kup_merged.fasta ${Arc_db} ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------Hppase-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF03030_HPPase_merged.faa ${Arc_db} ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta


#------------------------------------------------------NhaC-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF03553_NhaC_merged.faa ${Arc_db} ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------NhaD-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 25 ${Seq}/PF03600_NhaD_merged.faa ${Arc_db} ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

