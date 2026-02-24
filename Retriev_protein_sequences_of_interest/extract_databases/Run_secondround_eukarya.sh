#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      EukB
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_output/EukB_%A.err
#SBATCH --output        slurm_output/EukB_%A.out

Euk_TSV=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.tsv
Euk_db=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.fasta
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/second_round/mmseqs/eukarya
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/initial_round/merged_all_three_domains



#----------------------------------------------------------MIP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_merged.fasta ${Euk_db} ${MMseqs}/PF00230_MIPmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00230_MIPmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00230_MIPmerged_vsEukarya_e03mmseq_fl_seq.fasta


#------------------------------------------------------NhaD-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03600_NhaD_merged.faa ${Euk_db} ${MMseqs}/PF03600_NhaDmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03600_NhaDmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03600_NhaDmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------NhaB-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06450_NhaB_merged.faa ${Euk_db} ${MMseqs}/PF06450_NhaBmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF06450_NhaBmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF06450_NhaBmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------KdP-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03814_Kdp_merged.faa ${Euk_db} ${MMseqs}/PF03814_Kdpmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03814_Kdpmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03814_Kdpmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------OpuAC-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04069_OpuAC_merged.fasta ${Euk_db} ${MMseqs}/PF04069_OpuACmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF04069_OpuACmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF04069_OpuACmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------TreT------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF21269_TreT_merged.fasta ${Euk_db} ${MMseqs}/PF21269_TreTmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF21269_TreTmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF21269_TreTmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------NqrA------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF24836_NqrA_merged.fasta ${Euk_db} ${MMseqs}/PF24836_NqrAmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF24836_NqrAmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF24836_NqrAmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------KimA------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PTHR47704_KimA.fasta ${Euk_db} ${MMseqs}/PTHR47704_KimAmerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF24836_NqrAmerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PTHR47704_KimAmerged_vsEukarya_e03mmseq_fl_seq.fasta

#------------------------------------------------------Betain_dehydrogenase------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/TIGR01804.1_Betain-aldehyde_dehydrogenase_merged.faa ${Euk_db} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/TIGR01804.1_Betain-aldehyde_dehydrogenasemerged_vsEukarya_e03mmseq_fl_seq.fasta
