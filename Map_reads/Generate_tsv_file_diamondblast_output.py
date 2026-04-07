from Bio import SeqIO
import os
def best_hit_dict(HMMscan, scan_dict):
    #open a HMMscan file provided
    with open(HMMscan, 'r') as H:
        for line in H:
            if line[0] != '#':
                #skip lines with # as this contains information not needed

                e_count =0
                #marker for a 

                best_match_hmm = line.split(' ')[0].split(' ')[-1]
                protein_id = line.split('_tax:')[0].split(' ')[-1]
                Taxonomy = (line.split('_tax:')[-1].split(' - ')[0])
                full_id = protein_id + '_tax:' + Taxonomy

                if line.count(' - ') == 2:
                    prelim_evalue = line.split(' - ')[2]

                else:
                    prelim_evalue = line.split(' - ')[1]
                    if 'Fe' in prelim_evalue:
                        prelim_evalue = line.split(' - ')[1].split('Fe')[0]
                    else:
                        prelim_evalue = line.split(' - ')[1]
                e_list = []
                for i in prelim_evalue.split(' '):
                    if i != '':
                        e_list.append(i)
                j = e_list[0]
                if 'e' in j:
                    if j[0].isalpha() == True:
                        pass
                    else:
                        evalue = pow(10,int(j.split('e')[1]))*float(j.split('e')[0])
               



                else:
                    if any(x.isalpha() for x in j) == True:
                        pass
                        
                    elif 'diol' in j:
                        pass
                    else:
                        evalue = float(j)

                if full_id not in scan_dict.keys():
                    entry_list = (best_match_hmm, evalue)
                    scan_dict[full_id] = entry_list

                elif scan_dict[full_id][1] < evalue:
                    pass
                else:
                    entry_list = (best_match_hmm, evalue)
                    scan_dict[full_id] =entry_list
    return(scan_dict)

import os
Pfam_dic = {}

for hmm in os.listdir('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM'):
    if '.' not in hmm:
        pass
    elif '_' not in hmm:
        pass
    elif 'pynb' in hmm:
        pass
    else:
        pfam_id = hmm.split('_')[0]
        with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/HMM/{}'.format(hmm), 'r') as HMM:
            for line in HMM:
                if 'NAME' in line:
                    Pfam_dic[pfam_id] = line.split('NAME')[1].split('\n')[0].split(' ')[-1]
for key in Pfam_dic.keys():
    print(key)

import sys
Protein_of_interest = sys.argv[1] #Pfam name PF02386 for TrkH
Tax_domain_of_interest = sys.argv[2]

scandir = '/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMscan/{}'.format(Tax_domain_of_interest)
from Bio import SeqIO

scan_dict = {}
#there are exceptions


import os
for hmmscan in os.listdir(scandir):
    if hmmscan.split('.')[-1] == 'tsv':
        if Protein_of_interest in hmmscan:
            HMMscan = '{}/{}'.format(scandir,hmmscan)
            scan_dict = best_hit_dict(HMMscan, scan_dict)

from Bio import SeqIO
entry_dic = {}
for entry in os.listdir('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/{}'.format(Tax_domain_of_interest)):
    if Protein_of_interest in entry:
        for record in SeqIO.parse('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/results/HMMsearch/{}/{}'.format(Tax_domain_of_interest, entry), 'fasta'):

            entry_dic[str(record.id.split('_tax')[0])] = (record.id, str(record.seq))
            

with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Protein/sequences/{}_{}_{}_HMMscanned_HMMaligned_18Match.fasta'.format(Tax_domain_of_interest, Protein_of_interest, Pfam_dic[Protein_of_interest]), 'w') as outfile:
    for key in scan_dict.keys():
        if scan_dict[key][0] == Pfam_dic[Protein_of_interest]:
            fasta_line = '>' + entry_dic[key.split('_tax')[0]][0] + '_protein:{}'.format(Protein_of_interest) + '\n' + entry_dic[key.split('_tax')[0]][1] + '\n'
            outfile.write(fasta_line)
