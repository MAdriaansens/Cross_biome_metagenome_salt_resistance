import os
import json

Map_dir = '/nesi/nobackup/uc04105/cross_biome_metagenome/Mapping_reads'
CPA_list = []

with open('/nesi/nobackup/uc04105/cross_biome_metagenome/SRR_info.json', 'r') as info_SRR:
    SRR_dict = json.load(info_SRR)

for key in SRR_dict.keys():
    print(SRR_dict[key], key)
    break

Read_count = {}
with open('/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/output.txt', 'r') as grep_arrow:
    for line in grep_arrow:
        if 'bbmerged' not in line:
            file_name = line.split('/')[-1].split('.')[0]
            pass
            #these are all fastq files and I used 'grep -r -c '@' to count the reads
        else:
            #these are all bbmerged files and I used 'grep -r -c '>' to count the reads
            file_name = line.split('/')[-1].split('.')[0]
            read_count = line.split('\n')[0].split(':')[1]
            Read_count[file_name] = read_count
grep_arrow.close()



with open('/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/cutadapt/output_fastq.txt', 'r') as grep_alpha:
    for line in grep_alpha:
        if 'bbmerged' not in line:
            file_name = line.split('/')[-1].split('.')[0].split('_cut')[0]
            read_count = line.split('\n')[0].split(':')[1]
            Read_count[file_name] = read_count
            #these are all fastq files and I used 'grep -r -c '@' to count the reads
        else:
            #these are all bbmerged files and I used 'grep -r -c '>' to count the reads
            pass
grep_alpha.close()



with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Intermediate_SRA_download_Feb2_vsCPA.tsv', 'w') as Intermediate:
    header =  'file_name' + '\t' + 'SRA_name' + '\t' + 'read_count' + '\t' + 'study' + '\t' + 'Description' + '\t' +  'pH' + '\t' + 'salinity' + '\t' + 'Temp' +  '\t' + 'total_CPA' + '\t' + 'count_CPA1' + '\t'  + 'count_CPA2' + '\t'  + 'count_Kef' + '\t'  + 'count_NhaA' + '\t'  + 'count_UncPROK' + '\t'  + 'count_Unc' + '\t'  + 'count_UncPseudomonadota' + '\t' + 'count_UncGammaproteobacteriota' + '\t' + 'count_UncArc'  + '\t' + 'count_NhaS5' + '\n'
    Intermediate.write(header)
    for Map in os.listdir(Map_dir):
        with open('{}/{}'.format(Map_dir, Map), 'r') as M8:
            file_path = '{}/{}'.format(Map_dir, Map)
            file_name = file_path.split('/')[-1].split('_matches')[0]
            if 'cutadapted' in file_name:
                file_name = file_name.split('_cutadapted')[0]
            elif '.fna' in file_name:
                file_name = file_name.split('.fna')[0]
            read_count = Read_count[file_name]
            #get info study
            SRA_name = file_name.split('_')[0]
            study = SRR_dict[SRA_name][0]
            pH = SRR_dict[SRA_name][2]
            salinity = SRR_dict[SRA_name][3]
            Description = SRR_dict[SRA_name][1]
            Temp = SRR_dict[SRA_name][-1]
            CPA_list = []
            
            count_CPA1 = 0
            count_CPA2 = 0
            count_Kef = 0
            count_NhaA = 0
            count_UncPROK = 0
            count_Unc = 0
            count_UncPseudomonadota = 0
            count_UncGammaproteobacteriota = 0
            count_NhaS5 = 0
            coutn_UncARC = 0
            for line in M8:
                CPA_list.append(line.split('\t')[1].split('_')[-1])
            count_CPA1 = CPA_list.count('CPA1')
            count_CPA2 = CPA_list.count('CPA2')
            count_Kef = CPA_list.count('Kef')
            count_NhaA = CPA_list.count('NhaA')
            count_NhaS5 = CPA_list.count('NhaS5')
            count_UncPseudomonadota = CPA_list.count('Pseudomonadota')
            count_UncGammaproteobacteriota = CPA_list.count('Gammaproteobacteriota')
            count_UncPROK =  CPA_list.count('UncPro') + CPA_list.count('UncPROK')
            count_UncArc = CPA_list.count('UncARC')
            #the 'Unc' in all makes this akward
            count_Unc = CPA_list.count('Unc')

            total_count =  count_CPA1 + count_CPA2 + count_Kef + count_NhaA + count_NhaS5 + count_UncPseudomonadota + count_UncGammaproteobacteriota + count_UncPROK + count_UncArc + count_Unc
            Line = file_name + '\t' + SRA_name +'\t' + str(read_count) + '\t' + study + '\t' + Description + '\t' +  str(pH) + '\t' + str(salinity) + '\t' + str(Temp) +  '\t' + str(total_count) + '\t' + str(count_CPA1) + '\t'  + str(count_CPA2) + '\t'  + str(count_Kef) + '\t'  + str(count_NhaA) + '\t'  + str(count_UncPROK) + '\t'  +  str(count_Unc) + '\t'  + str(count_UncPseudomonadota) + '\t' + str(count_UncGammaproteobacteriota) + '\t' + str(count_UncArc)  + '\t' + str(count_NhaS5) + '\n'
            Intermediate.write(Line)
        
