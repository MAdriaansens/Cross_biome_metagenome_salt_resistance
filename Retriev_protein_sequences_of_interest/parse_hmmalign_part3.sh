#!/bin/bash -e
#SBATCH --account       uc04105
#SBATCH --job-name      Bacalign
#SBATCH --time          102:00:00
#SBATCH --mem           4GB
#SBATCH --cpus-per-task 1
#SBATCH --error         slurm_output/Bacalign_%A-%a.err
#SBATCH --output        slurm_output/Bacalign_%A-%a.out

module load Python/3.11.3-gimkl-2022a
#MIP

for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF00230*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 155;
done

#Rps2
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF00318*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 151;
done

#Rpl4
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF00573*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 133;
done

#ClcA
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF00654*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 242;
done

#MsC
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF00924*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 48;
done


for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01235*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 315;
done

#CorA
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01544*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 204;
done

#Na_Ca_exchanger
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01699*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 106;
done

#MscL
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01741*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 87;
done

#MgtE

for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01769*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 87;
done

#MnhE
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF01899*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 101;
done

#BCCT
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF02028*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 342;
done

#Trehalose_PPase
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF02358*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 164;
done

#TrkH
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF02358*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 351;
done

#KUP
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF02705*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 305;
done

#HPPase
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF03030*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 453;
done

#KdP
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF03814*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 305;
done

#OpuAc
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF04069*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 180;
done

#MtrA
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF04208*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 120;
done
#BRCA1
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF05525*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 300;
done

#EctC
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF06339*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 89;
done

#BRCA2
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF13520*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 299;
done

#TreT
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF21269*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 101;
done

#NqrA
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PF24836*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 102;
done

#KimA
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/PTHR47704*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 433;#
done

#Betain
for file in /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/TIGR01804*sthk; do
    base=$(basename "$file" .sthk);
    echo "$file";
    python parse_stockholm_filter.py ${file} /home/mad149/00_nesi_projects/uc04105_nobackup/cross_biome_metagenome/Protein/results/HMMalign/Bacteria/${base}_filtered 327;
done

