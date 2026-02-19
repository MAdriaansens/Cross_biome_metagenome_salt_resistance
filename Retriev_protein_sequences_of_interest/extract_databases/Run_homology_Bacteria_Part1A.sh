#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      BacA
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_outputB/slurm_BacA_%A-%a.err
#SBATCH --output        slurm_outputB/slurm_BacA_%A-%a.out
#SBATCH --array         0-61

declare -a array=($(seq 0 61))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Bacteria
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#---------------------------------------------------------NhaC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF03553_NhaC_sequences.fasta  ${Bac_db} ${MMseqs}/PF03553_NhaCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03553_NhaCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF03553_NhaCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF03553_NhaChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03553_NhaC.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a
python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03553_NhaChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03553_NhaCHmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta



#---------------------------------------------------------NhaD------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF03600_NhaD_sequences.fasta  ${Bac_db} ${MMseqs}/PF03600_NhaDvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03600_NhaDvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF03600_NhaDvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF03600_NhaDhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03600_NhaD.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03600_NhaDhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03600_NhaDhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------Kdp------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF03814_KdpA_sequences.fasta  ${Bac_db} ${MMseqs}/PF03814_KdpAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03814_KdpAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF03814_KdpAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03814_kdp.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------OpuAC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF04069_OpuAC_sequences.fasta  ${Bac_db} ${MMseqs}/PF04069_OpuACvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp
module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04069_OpuACvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF04069_OpuACvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04069_OpuAC.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta


#---------------------------------------------------------MtrA------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF04208_MtrA_sequences.fasta  ${Bac_db} ${MMseqs}/PF04208_MtrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04208_MtrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF04208_MtrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04208_MtrA.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------EtcC-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF06339_EctC_sequences.fasta  ${Bac_db} ${MMseqs}/PF06339_EctCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06339_EctCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF06339_EctCvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF06339_EctC.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta


#---------------------------------------------------------NhaB-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF06450_NhaB_sequences.fasta  ${Bac_db} ${MMseqs}/PF06450_NhaBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06450_NhaBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF06450_NhaBvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF06450_NhaBhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF06450_NhaB.hmm ${Bac_db}
module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF06450_NhaBhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF06450_NhaBhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------TreT-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF21269_TreT_sequences.fasta  ${Bac_db} ${MMseqs}/PF21269_TreTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF21269_TreTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF21269_TreTvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF21269_TreT.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------NqrA----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PF24836_NqrA_sequences.fasta  ${Bac_db} ${MMseqs}/PF24836_NqrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PF24836_NqrAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF24836_NQRA.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------KimA----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/PTHR47704_KimA_sequences.faa  ${Bac_db} ${MMseqs}/PTHR47704_KimAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PTHR47704_KimAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/PTHR47704_KimAvsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PTHR47704_KimA.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------TIGR01804.1-Betain-Aldyhde-dehydrogenase----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 20 ${Seq}/TIGR01804.1-Betain-Aldyhde-dehydrogenase_sequences.fasta  ${Bac_db} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Bac_TSV} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.001 --tblout ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/TIGR01804.1_Betain-aldehyde-dehydrogenase.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta
