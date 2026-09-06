cat HMMalign/Adriaansens/*a Protein/filtered/*a > Protein/salinity_resistance_database.fasta

module load DIAMOND/2.2.4-GCC-14.3.0

diamond makedb --in Protein/salinity_resistance_database.fasta -d Protein/salinity_resistance_database.dmnd

