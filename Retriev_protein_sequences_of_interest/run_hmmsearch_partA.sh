#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      BacA
#SBATCH --time          102:00:00
#SBATCH --mem           40GB
#SBATCH --cpus-per-task 20
#SBATCH --error         slurm_outputBA/slurm_BacA_%A-%a.err
#SBATCH --output        slurm_outputBA/slurm_BacA_%A-%a.out
#SBATCH --array         0-61
declare -a array=($(seq 66 127))

HMMdir=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM
Bac_TSV=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/tsv/Bacteria_GTDB226_protein_May92025_chunk_${array[$SLURM_ARRAY_TASK_ID]}.tsv
Bac_db=/nesi/nobackup/uc04105/new_databases_May/GTDB_226/Bac_DB/fasta/Bacteria_GTDB226_protein_May92025_subset${array[$SLURM_ARRAY_TASK_ID]}.fasta
HMMsearch=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/Bacteria
MMseqs=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/MMseqs/Bacteria
Seq=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences

module load HMMER/3.4-GCC-12.3.0
module load Python/3.11.3-gimkl-2022a

#---------------------------------------------------------Kdp------------------------------------------------------------------------------------------------


#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF03814_kdp.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF03814_kdphmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------OpuAC------------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max  --tblout ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04069_OpuAC.hmm ${Bac_db}

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF04069_OpuAChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta


#---------------------------------------------------------MtrA------------------------------------------------------------------------------------------------



#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF04208_MtrA.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF04208_MtrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------EtcC-----------------------------------------------------------------------------------------------



#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max  --tblout ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF06339_EctC.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF06339_EctChmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

rm -r  ${HMMsearch}/*vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv


#---------------------------------------------------------TreT-----------------------------------------------------------------------------------------------


#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF21269_TreT.hmm ${Bac_db}

module load Python/3.11.3-gimkl-2022a

python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF21269_TreThmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------NqrA----------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PF24836_NQRA.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PF24836_NqrAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------KimA----------------------------------------------------------------------------------------------

#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/PTHR47704_KimA.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/PTHR47704_KimAhmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#---------------------------------------------------------TIGR01804.1-Betain-Aldyhde-dehydrogenase----------------------------------------------------------------------------------------------


#HMMsearch
hmmsearch --noali --cpu 20 -E 0.00001 --max --tblout ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv ${HMMdir}/TIGR01804.1_Betain-aldehyde-dehydrogenase.hmm ${Bac_db}


python getting_fasta_from_hit_extra_Arc.py ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv HMM ${Bac_TSV} ${HMMsearch}/TIGR01804.1_Betain-aldehyde-dehydrogenasehmmvs_vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03_fl_sequence.fasta

#--additional clean up
rm -r  ${HMMsearch}/*vsBacteria_subset${array[$SLURM_ARRAY_TASK_ID]}_e03.tsv
