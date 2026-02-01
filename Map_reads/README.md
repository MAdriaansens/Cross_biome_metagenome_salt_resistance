Reads were mapped using DIAMOND/2.1.14-GCC-12.3.0. First a db per gene of interest was generated. 
Using the command:
  diamond makedb --in CPA_fl_taxa_types.faa -d CPA_fl_taxa_diamond


Read counts per file were retrieved using bash:
    grep -r -c '>' . > Read_counts_all_grepped.txt
