#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      EukA
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_output/slurm_EukA_%A.err
#SBATCH --output        slurm_output/slurm_EukA_%A.out

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Euk_TSV=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.tsv
Euk_db=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Eukarya
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Eukarya
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#---------------------------------------------------------NhaC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03553_NhaC_sequences.fasta  ${Euk_db} ${MMseqs}/PF03553_NhaCvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03553_NhaCvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03553_NhaCvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03553_NhaChmmvs_Eukarya_e03.tsv ${HMMdir}/PF03553_NhaC.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF03553_NhaChmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF03553_NhaCHmmvs_Eukarya_e03_fl_sequence.fasta



#---------------------------------------------------------NhaD------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03600_NhaD_sequences.fasta  ${Euk_db} ${MMseqs}/PF03600_NhaDvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03600_NhaDvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03600_NhaDvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03600_NhaDhmmvs_Eukarya_e03.tsv ${HMMdir}/PF03600_NhaD.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF03600_NhaDhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF03600_NhaDhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------Kdp------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03814_KdpA_sequences.fasta  ${Euk_db} ${MMseqs}/PF03814_KdpAvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03814_KdpAvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03814_KdpAvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03814_kdphmmvs_Eukarya_e03.tsv ${HMMdir}/PF03814_kdp.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF03814_kdphmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF03814_kdphmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------OpuAC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04069_OpuAC_sequences.fasta  ${Euk_db} ${MMseqs}/PF04069_OpuACvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF04069_OpuACvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF04069_OpuACvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF04069_OpuAChmmvs_Eukarya_e03.tsv ${HMMdir}/PF04069_OpuAC.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF04069_OpuAChmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF04069_OpuAChmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------MtrA------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04208_MtrA_sequences.fasta  ${Euk_db} ${MMseqs}/PF04208_MtrAvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF04208_MtrAvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF04208_MtrAvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF04208_MtrAhmmvs_Eukarya_e03.tsv ${HMMdir}/PF04208_MtrA.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF04208_MtrAhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF04208_MtrAhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------EtcC-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06339_EctC_sequences.fasta  ${Euk_db} ${MMseqs}/PF06339_EctCvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF06339_EctCvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF06339_EctCvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF06339_EctChmmvs_Eukarya_e03.tsv ${HMMdir}/PF06339_EctC.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF06339_EctChmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF06339_EctChmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------NhaB-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06450_NhaB_sequences.fasta  ${Euk_db} ${MMseqs}/PF06450_NhaBvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF06450_NhaBvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF06450_NhaBvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF06450_NhaBhmmvs_Eukarya_e03.tsv ${HMMdir}/PF06450_NhaB.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF06450_NhaBhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF06450_NhaBhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------TreT-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF21269_TreT_sequences.fasta  ${Euk_db} ${MMseqs}/PF21269_TreTvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF21269_TreTvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF21269_TreTvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF21269_TreThmmvs_Eukarya_e03.tsv ${HMMdir}/PF21269_TreT.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF21269_TreThmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF21269_TreThmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------NqrA----------------------------------------------------------------------------------------------
#module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF24836_NqrA_sequences.fasta  ${Euk_db} ${MMseqs}/PF24836_NqrAvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF24836_NqrAvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF24836_NqrAvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF24836_NqrAhmmvs_Eukarya_e03.tsv ${HMMdir}/PF24836_NQRA.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF24836_NqrAhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF24836_NqrAhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------KimA----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PTHR47704_KimA_sequences.faa  ${Euk_db} ${MMseqs}/PTHR47704_KimAvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PTHR47704_KimAvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PTHR47704_KimAvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PTHR47704_KimAhmmvs_Eukarya_e03.tsv ${HMMdir}/PTHR47704_KimA.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PTHR47704_KimAhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PTHR47704_KimAhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------TIGR01804.1-Betain-Aldyhde-dehydrogenase----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/TIGR01804.1-Betain-Aldyhde-dehydrogenase_sequences.fasta  ${Euk_db} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_Eukarya_e03.tsv ${HMMdir}/TIGR01804.1_Betain-aldehyde-dehydrogenase.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_Eukarya_e03_fl_sequence.fasta


