#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      BacB
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB/slurm_BacB_%A-%a.err
#SBATCH --output        slurm_outputB/slurm_BacB_%A-%a.out
#SBATCH --array         0-137

declare -a array=($(seq 0 137))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Bacteria
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences

module load HMMER/3.4-GCC-12.3.0
module load Python/3.11.3-gimkl-2022a

#----------------------------------------------------------Rps2-------------------------------------------------------------------------#

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF00318_Rps2.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00318_Rps2hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv


#---------------------------------------------------------MIP--------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF00230_MIPhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF00230_MIP.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00230_MIPhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00230hmm_MIPvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------Rpl4--------------------------------------------------------------------------------------------------


hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF00573_Rpl4.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00573_Rpl4hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------ClcA--------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF00654_ClcA.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00654_ClcAhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------MscS--------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF00924_MscShmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF00924_MscS.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF00924_MscShmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF00924_MscShmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv


#---------------------------------------------------------Na/Alanine symporter--------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01235_Na_Ala_sym.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01235_Na_Ala_symhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------CorA--------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01544_CorAhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01544_CorA.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01544_CorAhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PPF01544_CorA.hmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------Na/Ca_exchanger--------------------------------------------------------------------------------------------------
#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01699_Na_Ca_ex.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01699_Na_Ca_exhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------MscL--------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01741_MscL.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01741_MscLhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------MgtE--------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01769_MgtE.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01769_MgtEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv


#---------------------------------------------------------MnhE--------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF01899_MnhE.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF01899_MnhEhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------BCCT-------------------------------------------------------------------------------------------------


#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF02028_BCCT.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02028_BCCThmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------OtsB------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF02358_Trehalose_PPase.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02358_Trehalose_PPasehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------TrkH------------------------------------------------------------------------------------------------


#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF02386_TrkH.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02386_TrkHhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv


#---------------------------------------------------------Kup------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF02705_KUP.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF02705_KUPhmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv

#---------------------------------------------------------HPPase------------------------------------------------------------------------------------------------

hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv ${HMMdir}/PF03030_HPPAse.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03030_HPPAsehmmvs_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03_fl_sequence.fasta

#--additional clean up
rm -r  ${HMMsearch}/*_Bacteria_subset${array[$SLURM_ARRAY_TASK_ID]}e03.tsv
rm -r tmp_Bacteria_${array[$SLURM_ARRAY_TASK_ID]}BB
