import glob
#this outputfile needs manual edits and checking, but for 540 of the files it should be fine 
with open('/home/mad149/chapter_meta_analysis/Read_count_file.tsv', 'w') as outfile:
    header = 'SRA_id' + '\t' + 'Read_count' + '\n'
    outfile.write(header)
    for output in glob.glob('/home/mad149/chapter_meta_analysis/slurm_xblastoutput/BacscanR_354974-*.out'):
        with open(output, 'r', encoding='utf-8') as f:
            for i, line in enumerate(f, 1):
                if i == 1:
                    if len(line.split('\n')[0]) > 0:
                        if 'C' in line.split('\n')[0][0] or 'C' in line.split('\n')[0][-1]:
                            pass
                        else:
                            SRA_id = (line.split('\n')[0])
                    
                elif i == 5:
                    total_count = line.split(' ')[2]
                    if line.split(' ')[2] == '':
                        total_count = (line.split(' ')[3])
                    if len(line.split(' ')) > 3:
                        if line.split(' ')[3] == '':
                            total_count = (line.split(' ')[3])

        if total_count.isnumeric() == True:
            Line = SRA_id + '\t' + total_count + '\n'
        else:
            print(output)
            Line = SRA_id + '\t' + 'error' + '\n'
        outfile.write(Line)
test_list = []
#this has issues with single reads or read files with 3 fastq files
with open('/home/mad149/chapter_meta_analysis/Read_count_file(1) - Read_count_file(1).tsv', 'r') as parse:
    next(parse, None)
    for entry in parse:
        test_list.append(entry.split('\t')[0])
print(len(test_list))

count_list=[]
with open('/home/mad149/chapter_meta_analysis/Read_count_file(1) - Read_count_file(1).tsv', 'r') as parse:
    next(parse, None)
    for entry in parse:
        count_list.append(entry.split('\t')[-1])
print(len(count_list))
#the read count should be different from eachother

print(len(set(count_list)))
with open('/home/mad149/chapter_meta_analysis/Aquatic_SRR_ids.txt', 'r') as test:
    for entry in test:
        full_entry = entry.split('\n')[0]
        if full_entry not in nr_list_SRR:
            pass
        elif full_entry not in test_list:
            print(full_entry)
import os
list_SRR = os.listdir('/home/mad149/chapter_meta_analysis/xblastoutput')
nr_list_SRR=[]
for SRR in list_SRR:
    nr_list_SRR.append(SRR.split('_')[0])
nr_list_SRR = list(set(nr_list_SRR))
print(len(nr_list_SRR))
from collections import Counter

