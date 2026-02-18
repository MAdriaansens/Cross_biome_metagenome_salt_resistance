#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      EukB
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_output/EukB_%A.err
#SBATCH --output        slurm_output/EukB_%A.out

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Euk_TSV=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.tsv
Euk_db=/nesi/nobackup/uc04105/new_databases_May/Euk_database_May/Euk_db_May_protein.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Eukarya
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Eukarya
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#----------------------------------------------------------Rps2-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00318_RpS2_sequences.fasta ${Euk_db} ${MMseqs}/PF00318_RpS2_vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00318_RpS2_vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00318_RpS2_vsEukarya_e03mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00318_Rps2hmmvs_Eukarya_e03.tsv ${HMMdir}/PF00318_Rps2.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF00318_Rps2hmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF00318_Rps2hmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------MIP--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_sequences.fasta ${Euk_db} ${MMseqs}/PF00230_MIPvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00230_MIPvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00230_MIPvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00230_MIPhmmvs_Eukarya_e03.tsv ${HMMdir}/PF00230_MIP.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF00230_MIPhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF00230hmm_MIPvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------Rpl4--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00573_RpL1andRpL4_sequences.fasta ${Euk_db} ${MMseqs}/PF00573_RpL1andRpL4vsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00573_RpL1andRpL4vsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00573_RpL1andRpL4vsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00573_Rpl4hmmvs_Eukarya_e03.tsv ${HMMdir}/PF00573_Rpl4.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF00573_Rpl4hmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF00573_Rpl4hmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------ClcA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00654_ClcA_sequences.fasta  ${Euk_db} ${MMseqs}/PF00654_ClcAvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00654_ClcAvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00654_ClcAvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00654_ClcAhmmvs_Eukarya_e03.tsv ${HMMdir}/PF00654_ClcA.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF00654_ClcAhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF00654_ClcAhmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------MscS--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00924_MscS_sequences.fasta  ${Euk_db} ${MMseqs}/PF00924_MscSvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF00924_MscSvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF00924_MscSvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00924_MscShmmvs_Eukarya_e03.tsv ${HMMdir}/PF00924_MscS.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF00924_MscShmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF00924_MscShmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Alanine symporter--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01235_Na_Alanine_symporter_sequences.fasta  ${Euk_db} ${MMseqs}/PF01235_Na_Alanine_symportersEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01235_Na_Alanine_symportersEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01235_Na_Alanine_symportervsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01235_Na_Ala_sym.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------CorA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01544_CorA_sequences.fasta ${Euk_db} ${MMseqs}/PF01544_CorA_sequencesvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01544_CorA_sequencesvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01544_CorA_sequencesvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01544_CorAhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01544_CorA.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01544_CorAhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PPF01544_CorA.hmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Ca_exchanger--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01699_Ca_exchanger_sequences.fasta  ${Euk_db} ${MMseqs}/PF01699_Ca_exchangervsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01699_Ca_exchangervsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01699_Ca_exchangervsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01699_Na_Ca_ex.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------MscL--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01741_MscL_sequences.fasta  ${Euk_db} ${MMseqs}/PF01741_MscLvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01741_MscLvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01741_MscLvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01741_MscLhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01741_MscL.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01741_MscLhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF01741_MscLhmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------MgtE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01769_MgtE_sequences.fasta  ${Euk_db} ${MMseqs}/PF01769_MgtEvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01769_MgtEvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01769_MgtEvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01769_MgtEhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01769_MgtE.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01769_MgtEhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF01769_MgtEhmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------MnhE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01899_MnhE_sequences.fasta  ${Euk_db} ${MMseqs}/PF01899_MnhEvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF01899_MnhEvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF01899_MnhEvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01899_MnhEhmmvs_Eukarya_e03.tsv ${HMMdir}/PF01899_MnhE.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF01899_MnhEhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF01899_MnhEhmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------BCCT-------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02028_BCCT_sequences.fasta  ${Euk_db} ${MMseqs}/PF02028_BCCTvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF02028_BCCTvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF02028_BCCTvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02028_BCCThmmvs_Eukarya_e03.tsv ${HMMdir}/PF02028_BCCT.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF02028_BCCThmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF02028_BCCThmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------OtsB------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02358_OtsB_sequences.fasta  ${Euk_db} ${MMseqs}/PF02358_OtsBvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF02358_OtsBvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF02358_OtsBvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Eukarya_e03.tsv ${HMMdir}/PF02358_Trehalose_PPase.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Eukarya_e03_fl_sequence.fasta

#---------------------------------------------------------TrkH------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02386_TrkH_sequences.fasta  ${Euk_db} ${MMseqs}/PF02386_TrkHvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF02386_TrkHvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF02386_Trk_vsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02386_TrkHhmmvs_Eukarya_e03.tsv ${HMMdir}/PF02386_TrkH.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF02386_TrkHhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF02386_TrkHhmmvs_Eukarya_e03_fl_sequence.fasta



#---------------------------------------------------------Kup------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02705_Kup_sequences.fasta  ${Euk_db} ${MMseqs}/PF02705_KupvsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF02705_KupvsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF02705_KupvsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02705_KUPhmmvs_Eukarya_e03.tsv ${HMMdir}/PF02705_KUP.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF02705_KUPhmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF02705_KUPhmmvs_Eukarya_e03_fl_sequence.fasta


#---------------------------------------------------------HPPase------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03030_HPPase_sequences.fasta  ${Euk_db} ${MMseqs}/PF03030_HPPasevsEukarya_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${MMseqs}/PF03030_HPPasevsEukarya_e03_mmseq.tsv MMSEQ ${Euk_TSV} ${MMseqs}/PF03030_HPPasevsEukarya_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03030_HPPAsehmmvs_Eukarya_e03.tsv ${HMMdir}/PF03030_HPPAse.hmm ${Euk_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Euk.py ${HMMsearch}/PF03030_HPPAsehmmvs_Eukarya_e03.tsv HMM ${Euk_TSV} ${HMMsearch}/PF03030_HPPAsehmmvs_Eukarya_e03_fl_sequence.fasta


