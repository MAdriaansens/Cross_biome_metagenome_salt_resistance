#NhaB
#NhaC
#NhaD

import os
from Bio import SeqIO

for entry in os.listdir('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/IT_sequences'):
    if 'NhaB' in entry:
        with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences/NhaB_All_fl_sequences.fasta', 'w') as :
            for record in SeqIO.parse('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences/Adriaansens_CPA/IT_sequences/{}'.format(entry), 'fasta'):
                record_name = '>' + record.id + '_protein:PF03600' + '\n' + str(record.seq) + '\n'
                NhaD.write(record_name)
