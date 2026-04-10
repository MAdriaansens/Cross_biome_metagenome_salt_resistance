#!/bin/bash -e
#SBATCH --account=uc04105
#SBATCH --job-name=parse_filter_cat
#SBATCH --time=72:00:00
#SBATCH --mem=5GB
#SBATCH --cpus-per-task=2
#SBATCH --error=slurm_output/parse_seq_%A-%a.err
#SBATCH --output=slurm_output/parse_seq_%A-%a.out

HMMalign=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign
CPA=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/CPA/CPA_fl_taxa_types.fasta
NhaD=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/IT_sequences/NhaD_merged_fl.fasta
NhaC=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/IT_sequences/NhaC_merged_fl.fasta
NhaB=/home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/IT_sequences/NhaB_merged_fl.fasta

module load HMMER/3.4-GCC-12.3.0

hmmalign -o ${HMMalign}/All_CPA_aligned_PF00999.sthk /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/HMM/PF00999.hmm ${CPA}
hmmalign -o ${HMMalign}/All_NhaB_aligned_PF06450.sthk /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/HMM/PF06450.hmm ${NhaB}
hmmalign -o ${HMMalign}/All_NhaC_aligned_PF03553.sthk /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/HMM/PF03553.hmm ${NhaC}
hmmalign -o ${HMMalign}/All_NhaD_aligned_PF03600.sthk /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/HMM/PF03600.hmm ${NhaD}

module load Python/3.11.6-foss-2023a
python parse_stockholm_filter.py ${HMMalign}/All_CPA_aligned_PF00999.sthk ${HMMalign}/All_CPA_aligned_PF00999 235
python parse_stockholm_filter.py ${HMMalign}/All_NhaB_aligned_PF06450.sthk ${HMMalign}/All_NhaB_aligned_PF06450 361
python parse_stockholm_filter.py ${HMMalign}/All_NhaC_aligned_PF03553.sthk ${HMMalign}/All_NhaC_aligned_PF03553 212
python parse_stockholm_filter.py ${HMMalign}/All_NhaD_aligned_PF03600.sthk ${HMMalign}/All_NHaD_aligned_PF03600 235
#this code was the pull back only the part of CPA and IT which aligned to the hmm homologs. 
