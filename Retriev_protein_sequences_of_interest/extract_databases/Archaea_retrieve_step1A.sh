#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      ArcA
#SBATCH --time          102:00:00
#SBATCH --mem           100GB
#SBATCH --cpus-per-task 25
#SBATCH --error         slurm_output/slurm_ArcA_%A%a.err
#SBATCH --output        slurm_output/slurm_ArcA_%A%a.out
#SBATCH --array         1-12

declare -a array=($(seq 1 12))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Arc_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Archaea_protein_May92025.tsv
Arc_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/ARCDB/Archaea_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Archaea
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Archaea
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences


#---------------------------------------------------------NhaC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03553_NhaC_sequences.fasta  ${Arc_db} ${MMseqs}/PF03553_NhaCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03553_NhaCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03553_NhaCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03553_NhaChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03553_NhaC.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a
python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03553_NhaChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF03553_NhaCHmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta



#---------------------------------------------------------NhaD------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03600_NhaD_sequences.fasta  ${Arc_db} ${MMseqs}/PF03600_NhaDvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03600_NhaDvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03600_NhaDvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03600_NhaDhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03600_NhaD.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03600_NhaDhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF03600_NhaDhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------Kdp------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF03814_KdpA_sequences.fasta  ${Arc_db} ${MMseqs}/PF03814_KdpAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF03814_KdpAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF03814_KdpAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF03814_kdphmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03814_kdp.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03814_kdphmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF03814_kdphmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------OpuAC------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04069_OpuAC_sequences.fasta  ${Arc_db} ${MMseqs}/PF04069_OpuACvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp
module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04069_OpuACvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF04069_OpuACvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF04069_OpuAChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04069_OpuAC.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04069_OpuAChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF04069_OpuAChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta


#---------------------------------------------------------MtrA------------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF04208_MtrA_sequences.fasta  ${Arc_db} ${MMseqs}/PF04208_MtrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF04208_MtrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF04208_MtrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF04208_MtrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04208_MtrA.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04208_MtrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF04208_MtrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------EtcC-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06339_EctC_sequences.fasta  ${Arc_db} ${MMseqs}/PF06339_EctCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06339_EctCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF06339_EctCvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF06339_EctChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF06339_EctC.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF06339_EctChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF06339_EctChmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta


#---------------------------------------------------------NhaB-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF06450_NhaB_sequences.fasta  ${Arc_db} ${MMseqs}/PF06450_NhaBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF06450_NhaBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF06450_NhaBvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF06450_NhaBhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF06450_NhaB.hmm ${Arc_db}
module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF06450_NhaBhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF06450_NhaBhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------TreT-----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF21269_TreT_sequences.fasta  ${Arc_db} ${MMseqs}/PF21269_TreTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF21269_TreTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF21269_TreTvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF21269_TreThmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF21269_TreT.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF21269_TreThmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF21269_TreThmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------NqrA----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PF24836_NqrA_sequences.fasta  ${Arc_db} ${MMseqs}/PF24836_NqrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PF24836_NqrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PF24836_NqrAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PF24836_NqrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF24836_NQRA.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF24836_NqrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PF24836_NqrAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------KimA----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/PTHR47704_KimA_sequences.faa  ${Arc_db} ${MMseqs}/PTHR47704_KimAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/PTHR47704_KimAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/PTHR47704_KimAvsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/PTHR47704_KimAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PTHR47704_KimA.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PTHR47704_KimAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/PTHR47704_KimAhmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------TIGR01804.1-Betain-Aldyhde-dehydrogenase----------------------------------------------------------------------------------------------
module load MMseqs2/15-6f452-gompi-2023a

mmseqs easy-search -e 1.00E-03 -c 0.0 --threads 10 ${Seq}/TIGR01804.1-Betain-Aldyhde-dehydrogenase_sequences.fasta  ${Arc_db} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv tmp

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq.tsv MMSEQ ${Arc_TSV} ${MMseqs}/TIGR01804.1-Betain-Aldyhde-dehydrogenasevsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_mmseq_fl_seq.fasta

module purge

module load HMMER/3.4-GCC-12.3.0

#HMMsearch
hmmsearch --noali --cpu 10 -E 0.001 --tblout ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/TIGR01804.1_Betain-aldehyde-dehydrogenase.hmm ${Arc_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Arc_TSV} ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsArchaea_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta



