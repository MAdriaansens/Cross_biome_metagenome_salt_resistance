import os
from collections import Counter
SRR_list='/nesi/nobackup/uc04105/cross_biome_metagenome/DNA/xlbast_output'

SRR_directory = {}
list_hit_query = []
list_hit_subject = []


def return_dictionary_diamond_blast(Directory, SRR_id):
    SRR_directory = {}
    SRR_parse_list = []
    SRR_parse_list.append(SRR_id + '_1_vs_Salt_DB.m8')
    SRR_parse_list.append(SRR_id + '_2_vs_Salt_DB.m8') 
    for SRR in SRR_parse_list:
        if os.path.exists('{}/{}'.format(Directory, SRR)):
           with open('{}/{}'.format(Directory, SRR), 'r') as M8:
              for line in M8:
                if line.split('\t')[0] not in SRR_directory:

                    #qseqid sseqid slen evalue bitscore qseq qseq_translated 
                    SRR_directory[line.split('\t')[0]] = [line.split('\t')[1], line.split('\t')[3], line.split('\t')[-3], line.split('\t')[6].split('\n')[0]]
                else:
                    #test if protein is identical let it pass
                    if line.split('\t')[1].split('_')[-1] ==  SRR_directory[line.split('\t')[0]][0].split('_')[-1]:

                        pass
                    #else protein is not identical so we pick the most significant hit
                    
                    else:
                        if float(line.split('\t')[3]) > float(SRR_directory[line.split('\t')[0]][1]): 
                           #if new value has a bigger evalue we pass
                            pass
                        elif float(line.split('\t')[3]) < float(SRR_directory[line.split('\t')[0]][1]):
                            #if new value has a smaller evalue we write it in
                            SRR_directory[line.split('\t')[0]] = [line.split('\t')[1], line.split('\t')[3], line.split('\t')[-3], line.split('\t')[6].split('\n')[0]]
                        else:
                            if line.split('\t')[-3] ==  SRR_directory[line.split('\t')[0]][2]:
                                del SRR_directory[line.split('\t')[0]]
                                #neither have a higher bit value so I skip them
                            elif line.split('\t')[-3] >  SRR_directory[line.split('\t')[0]][2]:
                                #the new one has a higher bit value and is selcted
                                #protein id, e-value, bitscore, protein sequence
                                SRR_directory[line.split('\t')[0]] = [line.split('\t')[1], line.split('\t')[3], line.split('\t')[-3], line.split('\t')[6].split('\n')[0]]
                            else:
                                #the original has a higher bit value
                                pass
        else:
            print('{}/{} does not exist'.format(Directory, SRR))
    return(SRR_directory)              

Agaricus_dict = {'EukM6_150677' : 'CPA1', 'EukM6_150455' : 'CPA1' , 'EukM6_152373' : 'CPA1', 'EukM6_145055' : 'CPA1', 'EukM6_146072' : 'CPA2', 'EukM6_152396': 'CPA2'}

import sys
ID=sys.argv[1]
SRR_id_list = [ID]


for SRR_id in SRR_id_list:
    
    xblast_output_dictionary = {}
    xblast_output_dictionary = dict(return_dictionary_diamond_blast(SRR_list, SRR_id))
    print(len(xblast_output_dictionary))
    SRA_id = SRR_id

    #CPAs
    total_CPA_count = 0
    CPA1_count = 0
    CPA2_count = 0
    Kef_count = 0
    NhaA_count = 0
    Uncharacterized_CPA_count = 0
    NxK_Gammaproteobacteriota_count = 0
    Uncharacterized_prokarya_CPA_count = 0
    DxK_Pseudomonadota_CPA_count = 0 
    NhaS5_CPA_count = 0
    Uncharacterized_archaea = 0
    Latescibacteriota_CPA_count = 0
    BCCT_count =0
    MIP_count = 0
    RpS2_count = 0
    RpL4_count = 0
    ClcA_count =0
    MscS_count =0
    MscL_count =0
    Na_ala_count = 0
    CorA_count = 0
    Na_Ca_count = 0
    MgtE_count = 0
    MnhE_count =0
    Trehalose_PPase_count = 0
    TrkH_count  = 0
    Hppase_count =0
    NhaB_count = 0
    NhaC_count = 0
    NhaD_count =0
    Kup_count = 0
    Kdp_count = 0
    OpuAC_count = 0
    TreT_count =0
    EctC_count = 0
    MtrA_count = 0
    AApermease_count = 0
    NqrA_count = 0
    Betain_ald_dehyd_count = 0
    KimA_count = 0
    BranchedchainAA_transp_count = 0
    Sequence=''
    print(SRA_id)
    for key in xblast_output_dictionary.keys():
        if 'protein:' in xblast_output_dictionary[key][0]:
            if xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF00318':
                RpS2_count = RpS2_count + 1
                Sequence = Sequence + xblast_output_dictionary[key][-1]
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF00573':
                RpL4_count = RpL4_count + 1
                Sequence = Sequence + xblast_output_dictionary[key][-1]
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF00924':
                MscS_count =MscS_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01741':
                MscL_count =MscL_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01544':
                CorA_count =CorA_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01235':
                Na_ala_count =Na_ala_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF00654':
                ClcA_count = ClcA_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF02028':
                BCCT_count = BCCT_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF00230':
                MIP_count = MIP_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01699':
                Na_Ca_count = Na_Ca_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01769':
                MgtE_count = MgtE_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01899':
                MnhE_count = MnhE_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF01769':
                MgtE_count = MgtE_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF02358':
                Trehalose_PPase_count = Trehalose_PPase_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF02386':
                TrkH_count = TrkH_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF02705':
                 Kup_count = Kup_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF03030':
                 Hppase_count = Hppase_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF06450':
                NhaB_count = NhaB_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF03553':
                NhaC_count = NhaC_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF03600':
                NhaD_count = NhaD_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF03814':
                Kdp_count = Kdp_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF04069':
                OpuAC_count = OpuAC_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF04208':
                MtrA_count = MtrA_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF05525':
                BranchedchainAA_transp_count = BranchedchainAA_transp_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF06339':
                EctC_count = EctC_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF13520':
                AApermease_count = AApermease_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF21269':
                TreT_count = TreT_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PF24836':
                NqrA_count = NqrA_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'PTHR47704':
                KimA_count = KimA_count + 1
            elif xblast_output_dictionary[key][0].split('protein:')[-1] == 'TIGR01804':
                Betain_ald_dehyd_count = Betaine_ald_dehyd_count + 1
            else:
                pass
        else:
            total_CPA_count = total_CPA_count + 1

            if xblast_output_dictionary[key][0].split('_')[-1] == 'Kef':
                Kef_count = Kef_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'CPA1':
                CPA1_count = CPA1_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'CPA2':     
                CPA2_count = CPA2_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'NhaA':     
                NhaA_count = NhaA_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] =='Gammaproteobacteriota':
                NxK_Gammaproteobacteriota_count = NxK_Gammaproteobacteriota_count+1
            elif xblast_output_dictionary[key][0].split('_')[-1] =='Unc':
                Uncharacterized_CPA_count = Uncharacterized_CPA_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'UncPro':
                Uncharacterized_prokarya_CPA_count = Uncharacterized_prokarya_CPA_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'UncPROK':
                Uncharacterized_prokarya_CPA_count = Uncharacterized_prokarya_CPA_count + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] ==  'Pseudomonadota':
                DxK_Pseudomonadota_CPA_count = DxK_Pseudomonadota_CPA_count +1
            elif xblast_output_dictionary[key][0].split('_')[-1] ==  'NhaS5':
                NhaS5_CPA_count = NhaS5_CPA_count +1
            elif xblast_output_dictionary[key][0].split('_')[-1] ==  'UncArc':
                Uncharacterized_archaea =  Uncharacterized_archaea + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] ==  'UncARC':
                Uncharacterized_archaea =  Uncharacterized_archaea + 1
            elif xblast_output_dictionary[key][0].split('_')[-1] == 'cpa':
                Latescibacteriota_CPA_count = Latescibacteriota_CPA_count + 1
            else:
                if 'ATCC' in  xblast_output_dictionary[key][0].split('_')[-1]:
                    CPA2_count = CPA2_count + 1
                elif 'Agaricus_bisporus_' in  xblast_output_dictionary[key][0]:
                    CPA_type =  xblast_output_dictionary[key][0].split('_Agaricus')[0]
                    if CPA_type == 'CPA1':
                        CPA1_count = CPA1_count + 1
                    else:
                        CPA2_count = CPA2_count + 1
                else:
                    print('issue')
                    print(xblast_output_dictionary[key][0])
                    break
    #print('count:', 'count:')
    DEIK_ratio =  str((Sequence.count('D') + Sequence.count('E'))/(Sequence.count('I') + Sequence.count('K')))
    RK_ratio =  str(Sequence.count('R')/Sequence.count('K'))

    Line = SRA_id + '\t' + str(RpS2_count) + '\t' + str(RpL4_count) + '\t' + str(DEIK_ratio) + '\t' + str(RK_ratio) + '\t' + str(MIP_count) + '\t' + str(ClcA_count) + '\t' + \
str(MscS_count) + '\t' + str(MscL_count) + '\t' + str(OpuAC_count) + '\t' + str(Na_ala_count) + '\t' + str(CorA_count) + '\t' + str(Na_Ca_count) + '\t' + str(BCCT_count) + '\t' + str(MgtE_count) + '\t' + str(EctC_count) + \
'\t' + str(MnhE_count) + '\t' + str(Trehalose_PPase_count) + '\t' + str(TrkH_count) + '\t' + str(Kup_count) + '\t' + str(Hppase_count) + '\t' + str(NhaB_count) + '\t' + str(NhaC_count) + '\t' + str(NhaD_count ) + '\t' + str(Kdp_count) + \
'\t' + str(MtrA_count) + '\t' + str(AApermease_count) + '\t' + str(BranchedchainAA_transp_count) + '\t' + str(TreT_count) + '\t' + str(NqrA_count) + '\t' + str(KimA_count) + '\t' + str(Betain_ald_dehyd_count) + '\t' \
+ str(total_CPA_count) + '\t' + str(Uncharacterized_CPA_count) + '\t' + str(Kef_count) + '\t' + str(CPA1_count) + '\t' + str(CPA2_count) + '\t' + str(NhaA_count) + '\t' + str(NhaS5_CPA_count) + '\t' + str(Uncharacterized_archaea) + '\t' \
+ str(Uncharacterized_prokarya_CPA_count) + '\t' + str(DxK_Pseudomonadota_CPA_count) + '\t' + str(NxK_Gammaproteobacteriota_count) + '\t' + str(Latescibacteriota_CPA_count) + '\n'
    print(Line)


    with open('/nesi/nobackup/uc04105/cross_biome_metagenome/xblast_output_parsed_1066_31March.tsv', 'a') as output_file:
        output_file.write(Line)
    output_file.close()
