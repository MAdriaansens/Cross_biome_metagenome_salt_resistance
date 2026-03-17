#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Eukalign
#SBATCH --time          102:00:00
#SBATCH --mem           4GB
#SBATCH --cpus-per-task 1
#SBATCH --error         slurm_output/Eukalign_%A-%a.err
#SBATCH --output        slurm_output/Eukalign_%A-%a.out

module load Python/3.11.3-gimkl-2022a

PFAM_list=/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/Pfam_list.txt
Taxonomic_domain='Archaea' #or bacteria/eukarya
while read Pfam; do
    python parse_hmmscan.py "$Pfam" "$Taxonomic_domain"
done <"$PFAM_list"
