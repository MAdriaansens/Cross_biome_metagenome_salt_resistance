#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Arc_round2
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputA2/Arc2_%A.err
#SBATCH --output        slurm_outputA2/Arc2_%A.out
#SBATCH --array         0-12
declare -a array=($(seq 0 12))
Arc_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Archaea_GTDB226_protein_May92025.tsv
Arc_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/ARCDB/Archaea_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/second_round/mmseqs/archaea
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/initial_round/merged_all_three_domains


#----------------------------------------------------------Rps2-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00318_RpS2_merged.fasta ${Arc_db} ${MMseqs}/PF00318_RpS2merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00318_RpS2merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00318_RpS2merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#----------------------------------------------------------RpL4-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00573_RpL4_merged.fasta ${Arc_db} ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00573_RpL4merged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#----------------------------------------------------------MIP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_merged.fasta ${Arc_db} ${MMseqs}/PF00230_MIPmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00230_MIPmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00230_MIPmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#----------------------------------------------------------ClCA-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00654_ClcA_merged.fasta ${Arc_db} ${MMseqs}/PF00654_ClcAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00654_ClcAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00654_ClcAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------MscS-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00924_MscS_merged.faa ${Arc_db} ${MMseqs}/PF00924_MscSmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00924_MscSmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00924_MscSmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------Na_alanine_symporter-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01235_Na_alanine_symporter_merged.fasta ${Arc_db} ${MMseqs}/PF01235_Na_alanine_symportermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01235_Na_alanine_symportermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01235_Na_alanine_symportermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------Na_alanine_symporter-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01544_CorA_merged.faa ${Arc_db} ${MMseqs}/PF01544_CorAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01544_CorAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01544_CorAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#---------------------------------------------------------Ca_exchanger-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01699_Ca_exchanger_merged.faa ${Arc_db} ${MMseqs}/PF01699_Ca_exchangermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01699_Ca_exchangermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01699_Ca_exchangermerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#--------------------------------------------------------MscL-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01741_MscL_merged.faa ${Arc_db} ${MMseqs}/PF01741_MscLmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01741_MscLmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01741_MscLmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#--------------------------------------------------------MscL-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01769_MgtE_merged.faa ${Arc_db} ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01769_MgtEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#--------------------------------------------------------MnhE-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01899_MnhE_merged.fasta ${Arc_db} ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01899_MnhEmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------BCCT-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02028_BCCT_merged.fasta ${Arc_db} ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02028_BCCTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta
#-------------------------------------------------------OtsB-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02358_OtsB_merged.fasta ${Arc_db} ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02358_OtsBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------TrkH-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02386_TrkH_merged.faa ${Arc_db} ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02386_TrkHmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#-------------------------------------------------------Kup-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02705_Kup_merged.fasta ${Arc_db} ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02705_Kupmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------Hppase-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03030_HPPase_merged.faa ${Arc_db} ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03030_HPPasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta


#------------------------------------------------------NhaC-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03553_NhaC_merged.faa ${Arc_db} ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03553_NhaCmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------NhaD-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03600_NhaD_merged.faa ${Arc_db} ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03600_NhaDmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------NhaB-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06450_NhaB_merged.faa ${Arc_db} ${MMseqs}/PF06450_NhaBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06450_NhaBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF06450_NhaBmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------KdP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03814_Kdp_merged.faa ${Arc_db} ${MMseqs}/PF03814_Kdpmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03814_Kdpmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03814_Kdpmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------OpuAC-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04069_OpuAC_merged.fasta ${Arc_db} ${MMseqs}/PF04069_OpuACmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04069_OpuACmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF04069_OpuACmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------TreT------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF21269_TreT_merged.fasta ${Arc_db} ${MMseqs}/PF21269_TreTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF21269_TreTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF21269_TreTmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------NqrA------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF24836_NqrA_merged.fasta ${Arc_db} ${MMseqs}/PF24836_NqrAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF24836_NqrAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------KimA------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PTHR47704_KimA.fasta ${Arc_db} ${MMseqs}/PTHR47704_KimAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PTHR47704_KimAmerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

#------------------------------------------------------Betain_dehydrogenase------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/TIGR01804.1_Betain-aldehyde_dehydrogenase_merged.faa ${Arc_db} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea${array[$SLURM_ARRAY_TASK_ID]}_tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsArchaea${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

