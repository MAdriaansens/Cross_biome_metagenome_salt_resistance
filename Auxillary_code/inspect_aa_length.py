import numpy as np
import random
from matplotlib import pyplot as plt

taxa_list = []
AAlength_list = []
AAlength_evalue = []
from collections import Counter
with open('/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/xlbast_output/SRR11582141_1_vs_Salt_DB.m8' ) as to_parse:
    for line in to_parse:
        #PF13520
        if 'PF13520' in line.split('\t')[1]:
            AA_length = len(line.split('\t')[-1].split('\n')[0])
            AAlength_list.append(AA_length)
            if float(line.split('\t')[3]) > 0.0000000001:
                AAlength_evalue.append(AA_length)
            if 'g__' not in line:
                    pass
            else:
                taxa_list.append(line.split('\t')[1].split(';g__')[1].split(';s')[0])


plt.xlim([min(AAlength_list)-5, max(AAlength_list)+5])

plt.hist(AAlength_list, alpha=0.5)

plt.xlim([min(AAlength_evalue)-5, max(AAlength_evalue)+5])

plt.hist(AAlength_evalue, alpha=0.5)

import numpy as np
import random
from matplotlib import pyplot as plt

taxa_list = []
AAlength_list = []
AAlength_evalue = []
from collections import Counter
with open('/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/xlbast_output/SRR22299279_1_vs_Salt_DB.m8' ) as to_parse:
    for line in to_parse:
        #PF13520
        if 'PF13520' in line.split('\t')[1]:
            AA_length = len(line.split('\t')[-1].split('\n')[0])
            AAlength_list.append(AA_length)
            if float(line.split('\t')[3]) > 0.0000000001:
                AAlength_evalue.append(AA_length)
            if 'g__' not in line:
                    pass
            else:
                taxa_list.append(line.split('\t')[1].split(';g__')[1].split(';s')[0])


plt.xlim([min(AAlength_list)-5, max(AAlength_list)+5])

plt.hist(AAlength_list, alpha=0.5)

plt.xlim([min(AAlength_evalue)-5, max(AAlength_evalue)+5])

plt.hist(AAlength_evalue, alpha=0.5)
