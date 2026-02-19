#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      BacB
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB/slurm_BacB_%A-%a.err
#SBATCH --output        slurm_outputB/slurm_BacB_%A-%a.out
#SBATCH --array         0-61

declare -a array=($(seq 0 61))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Bacteria
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#----------------------------------------------------------Rps2-------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a
mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00318_RpS2_sequences.fasta ${Bac_db} ${MMseqs}/PF00318_RpS2_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00318_RpS2_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00318_RpS2_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_e03.tsv ${HMMdir}/PF00318_Rps2.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------MIP--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00230_MIP_sequences.fasta ${Bac_db} ${MMseqs}/PF00230_MIPvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00230_MIPvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00230_MIPvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00230_MIPhmmvs_Bacteria_e03.tsv ${HMMdir}/PF00230_MIP.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00230_MIPhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00230hmm_MIPvs_Bacteria_e03_fl_sequence.fasta

#---------------------------------------------------------Rpl4--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00573_RpL1andRpL4_sequences.fasta ${Bac_db} ${MMseqs}/PF00573_RpL1andRpL4vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00573_RpL1andRpL4vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00573_RpL1andRpL4vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_e03.tsv ${HMMdir}/PF00573_Rpl4.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------ClcA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00654_ClcA_sequences.fasta  ${Bac_db} ${MMseqs}/PF00654_ClcAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00654_ClcAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00654_ClcAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_e03.tsv ${HMMdir}/PF00654_ClcA.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------MscS--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF00924_MscS_sequences.fasta  ${Bac_db} ${MMseqs}/PF00924_MscSvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF00924_MscSvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF00924_MscSvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF00924_MscShmmvs_Bacteria_e03.tsv ${HMMdir}/PF00924_MscS.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00924_MscShmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00924_MscShmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Alanine symporter--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01235_Na_Alanine_symporter_sequences.fasta  ${Bac_db} ${MMseqs}/PF01235_Na_Alanine_symportersBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01235_Na_Alanine_symportersBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01235_Na_Alanine_symportervsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01235_Na_Ala_sym.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------CorA--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01544_CorA_sequences.fasta ${Bac_db} ${MMseqs}/PF01544_CorA_sequencesvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01544_CorA_sequencesvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01544_CorA_sequencesvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01544_CorAhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01544_CorA.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01544_CorAhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PPF01544_CorA.hmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------Na/Ca_exchanger--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01699_Ca_exchanger_sequences.fasta  ${Bac_db} ${MMseqs}/PF01699_Ca_exchangervsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01699_Ca_exchangervsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01699_Ca_exchangervsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01699_Na_Ca_ex.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_e03_fl_sequence.fasta

#---------------------------------------------------------MscL--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01741_MscL_sequences.fasta  ${Bac_db} ${MMseqs}/PF01741_MscLvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01741_MscLvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01741_MscLvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01741_MscL.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------MgtE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01769_MgtE_sequences.fasta  ${Bac_db} ${MMseqs}/PF01769_MgtEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01769_MgtEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01769_MgtEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01769_MgtE.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------MnhE--------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF01899_MnhE_sequences.fasta  ${Bac_db} ${MMseqs}/PF01899_MnhEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF01899_MnhEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF01899_MnhEvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_e03.tsv ${HMMdir}/PF01899_MnhE.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_e03_fl_sequence.fasta

#---------------------------------------------------------BCCT-------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02028_BCCT_sequences.fasta  ${Bac_db} ${MMseqs}/PF02028_BCCTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02028_BCCTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF02028_BCCTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_e03.tsv ${HMMdir}/PF02028_BCCT.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_e03_fl_sequence.fasta

#---------------------------------------------------------OtsB------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02358_OtsB_sequences.fasta  ${Bac_db} ${MMseqs}/PF02358_OtsBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02358_OtsBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF02358_OtsBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_e03.tsv ${HMMdir}/PF02358_Trehalose_PPase.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_e03_fl_sequence.fasta

#---------------------------------------------------------TrkH------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02386_TrkH_sequences.fasta  ${Bac_db} ${MMseqs}/PF02386_TrkHvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02386_TrkHvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF02386_Trk_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_e03.tsv ${HMMdir}/PF02386_TrkH.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_e03_fl_sequence.fasta



#---------------------------------------------------------Kup------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF02705_Kup_sequences.fasta  ${Bac_db} ${MMseqs}/PF02705_KupvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF02705_KupvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF02705_KupvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_e03.tsv ${HMMdir}/PF02705_KUP.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_e03_fl_sequence.fasta


#---------------------------------------------------------HPPase------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03030_HPPase_sequences.fasta  ${Bac_db} ${MMseqs}/PF03030_HPPasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv Bacteria_${array[$SLURM_ARRAY_TASK_ID]}tmp_BB

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03030_HPPasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF03030_HPPasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_e03.tsv ${HMMdir}/PF03030_HPPAse.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_e03_fl_sequence.fasta

