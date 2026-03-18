SRR_list=[]
ERR_list=[]

with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Studies_salinity_metadata_All - Aerosols(3).tsv', 'r') as Aerosol:
    for line in Aerosol:
        if 'SRR' in (line.split('\t')[-3]):
            SRR_list.append(line.split('\t')[-3])
        elif 'DRR' in (line.split('\t')[-3]):
            SRR_list.append(line.split('\t')[-3])
        elif 'ERR' in (line.split('\t')[-3]):
            ERR_list.append(line.split('\t')[-3])
        else:
            pass
with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Studies_salinity_metadata_All - Studies_salinity_metadata_soil(5).tsv', 'r') as Soil:
    for line in Soil:
        if 'SRR' in (line.split('\t')[13]):
            SRR_list.append(line.split('\t')[13])
        elif 'DRR' in (line.split('\t')[13]):
            SRR_list.append(line.split('\t')[13])
        elif 'ERR' in (line.split('\t')[13]):
            ERR_list.append(line.split('\t')[13])
        else:
            pass
with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Studies_salinity_metadata_All - Biofilm(3).tsv', 'r') as Biofilm:
    for line in Biofilm:
        if 'SRR' in (line.split('\t')[11]):
            SRR_list.append(line.split('\t')[11])
        elif 'DRR' in (line.split('\t')[11]):
            SRR_list.append(line.split('\t')[11])
        elif 'ERR' in (line.split('\t')[11]):
            ERR_list.append(line.split('\t')[11])
        else:
            pass

with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Studies_salinity_metadata_All - Studies_salinity_metadata_water.csv(9).tsv', 'r') as Water:
    for line in Water:

        if 'SRR' in (line.split('\t')[13]):
            SRR_list.append(line.split('\t')[13])
        elif 'DRR' in (line.split('\t')[13]):
            SRR_list.append(line.split('\t')[13])
        elif 'ERR' in (line.split('\t')[13]):
            ERR_list.append(line.split('\t')[13])
        else:
            pass
print(len(SRR_list))

with open('SRR_list_parent.txt', 'w') as parent: 
    for SRR in SRR_list:
        parent.write(SRR + '\n')
