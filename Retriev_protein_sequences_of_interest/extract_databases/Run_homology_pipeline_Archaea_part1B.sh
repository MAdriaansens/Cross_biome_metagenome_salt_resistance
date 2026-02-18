#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      ArcB
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputA/ArcB_%A.err
#SBATCH --output        slurm_outputA/ArcB_%A.out

declare -a array=($(seq 0 12))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Arc_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Archaea_GTDB226_protein_May92025.tsv
Arc_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/ARCDB/Archaea_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Archaea
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Archaea
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#----------------------------------------------------------Rps2-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00318_RpS2_sequences.fasta ${Arc_db} ${MMseqs}/PF00318_RpS2_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00318_RpS2_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00318_RpS2_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00318_Rps2hmmvs_Archaea_e03.tsv ${HMMdir}/PF00318_Rps2.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00318_Rps2hmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF00318_Rps2hmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------MIP--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_sequences.fasta ${Arc_db} ${MMseqs}/PF00230_MIPvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00230_MIPvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00230_MIPvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00230_MIPhmmvs_Archaea_e03.tsv ${HMMdir}/PF00230_MIP.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00230_MIPhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF00230hmm_MIPvs_Archaea_e03_fl_sequence.fasta

#---------------------------------------------------------Rpl4--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00573_RpL1andRpL4_sequences.fasta ${Arc_db} ${MMseqs}/PF00573_RpL1andRpL4vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00573_RpL1andRpL4vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00573_RpL1andRpL4vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00573_Rpl4hmmvs_Archaea_e03.tsv ${HMMdir}/PF00573_Rpl4.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00573_Rpl4hmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF00573_Rpl4hmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------ClcA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00654_ClcA_sequences.fasta  ${Arc_db} ${MMseqs}/PF00654_ClcAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00654_ClcAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00654_ClcAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00654_ClcAhmmvs_Archaea_e03.tsv ${HMMdir}/PF00654_ClcA.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00654_ClcAhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF00654_ClcAhmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------MscS--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00924_MscS_sequences.fasta  ${Arc_db} ${MMseqs}/PF00924_MscSvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00924_MscSvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF00924_MscSvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00924_MscShmmvs_Archaea_e03.tsv ${HMMdir}/PF00924_MscS.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00924_MscShmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF00924_MscShmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Alanine symporter--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01235_Na_Alanine_symporter_sequences.fasta  ${Arc_db} ${MMseqs}/PF01235_Na_Alanine_symportersArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01235_Na_Alanine_symportersArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01235_Na_Alanine_symportervsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Archaea_e03.tsv ${HMMdir}/PF01235_Na_Ala_sym.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------CorA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01544_CorA_sequences.fasta ${Arc_db} ${MMseqs}/PF01544_CorA_sequencesvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01544_CorA_sequencesvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01544_CorA_sequencesvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01544_CorAhmmvs_Archaea_e03.tsv ${HMMdir}/PF01544_CorA.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01544_CorAhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PPF01544_CorA.hmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Ca_exchanger--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01699_Ca_exchanger_sequences.fasta  ${Arc_db} ${MMseqs}/PF01699_Ca_exchangervsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01699_Ca_exchangervsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01699_Ca_exchangervsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Archaea_e03.tsv ${HMMdir}/PF01699_Na_Ca_ex.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Archaea_e03_fl_sequence.fasta

#---------------------------------------------------------MscL--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01741_MscL_sequences.fasta  ${Arc_db} ${MMseqs}/PF01741_MscLvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01741_MscLvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01741_MscLvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01741_MscLhmmvs_Archaea_e03.tsv ${HMMdir}/PF01741_MscL.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01741_MscLhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF01741_MscLhmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------MgtE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01769_MgtE_sequences.fasta  ${Arc_db} ${MMseqs}/PF01769_MgtEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01769_MgtEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01769_MgtEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01769_MgtEhmmvs_Archaea_e03.tsv ${HMMdir}/PF01769_MgtE.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01769_MgtEhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF01769_MgtEhmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------MnhE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01899_MnhE_sequences.fasta  ${Arc_db} ${MMseqs}/PF01899_MnhEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01899_MnhEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF01899_MnhEvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01899_MnhEhmmvs_Archaea_e03.tsv ${HMMdir}/PF01899_MnhE.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01899_MnhEhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF01899_MnhEhmmvs_Archaea_e03_fl_sequence.fasta

#---------------------------------------------------------BCCT-------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02028_BCCT_sequences.fasta  ${Arc_db} ${MMseqs}/PF02028_BCCTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02028_BCCTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02028_BCCTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02028_BCCThmmvs_Archaea_e03.tsv ${HMMdir}/PF02028_BCCT.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02028_BCCThmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF02028_BCCThmmvs_Archaea_e03_fl_sequence.fasta

#---------------------------------------------------------OtsB------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02358_OtsB_sequences.fasta  ${Arc_db} ${MMseqs}/PF02358_OtsBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02358_OtsBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02358_OtsBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Archaea_e03.tsv ${HMMdir}/PF02358_Trehalose_PPase.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Archaea_e03_fl_sequence.fasta

#---------------------------------------------------------TrkH------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02386_TrkH_sequences.fasta  ${Arc_db} ${MMseqs}/PF02386_TrkHvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02386_TrkHvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02386_Trk_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02386_TrkHhmmvs_Archaea_e03.tsv ${HMMdir}/PF02386_TrkH.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02386_TrkHhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF02386_TrkHhmmvs_Archaea_e03_fl_sequence.fasta



#---------------------------------------------------------Kup------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02705_Kup_sequences.fasta  ${Arc_db} ${MMseqs}/PF02705_KupvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02705_KupvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF02705_KupvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02705_KUPhmmvs_Archaea_e03.tsv ${HMMdir}/PF02705_KUP.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02705_KUPhmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF02705_KUPhmmvs_Archaea_e03_fl_sequence.fasta


#---------------------------------------------------------HPPase------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03030_HPPase_sequences.fasta  ${Arc_db} ${MMseqs}/PF03030_HPPasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Archaea_${array[$SLURM_ARRAY_TASK_ID]}tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03030_HPPasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03030_HPPasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03030_HPPAsehmmvs_Archaea_e03.tsv ${HMMdir}/PF03030_HPPAse.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03030_HPPAsehmmvs_Archaea_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF03030_HPPAsehmmvs_Archaea_e03_fl_sequence.fasta


