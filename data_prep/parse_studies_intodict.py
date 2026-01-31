import json
SRR_info_dict = {}

with open('/nesi/nobackup/uc04105/cross_biome_metagenome/Studies_salinity_metadata - Studies_salinity_metadata_water.csv(1).tsv', 'r') as SRR_info:
    next(SRR_info, None)
    for info in SRR_info:
        Study=info.split('\t')[0]
        pH = info.split('\t')[2].replace(',', '.')
        Salinity = info.split('\t')[3].replace(',', '.')
        Description = info.split('\t')[4]
        SRR_id = info.split('\t')[6]
        if SRR_id == '-':
            pass 
        else:
            if info.split('\t')[-1][0].isnumeric():
                Temp = info.split('\t')[-1].split('\n')[0].replace(',', '.')
            else:
                Temp = 'NA'
            if '/' in SRR_id:
                for replicate in SRR_id.split('/'):
                    SRR_info_dict[replicate] = [Study, Description , pH, Salinity, Temp]
                    print(replicate, SRR_info_dict[replicate])
            else:
                SRR_info_dict[SRR_id] = [Study, Description , pH, Salinity, Temp]
                print(SRR_id, SRR_info_dict[SRR_id])
with open('SRR_info.json', 'w') as f:
    json.dump(SRR_info_dict, f)
