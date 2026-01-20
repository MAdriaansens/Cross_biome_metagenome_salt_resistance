**Description_studies(water)_used.xlsx** provides a outline of each study (including site, country, journal, reference to paper)
The samples were selected based on location (to be as wide spread and geographically diverse), sequencing method (Illumina or Nanopore) and the type of biological material
  Sequencing methods like pyrosequencing were avoided, we did select two studies using Pyroseq, 454 titanium
  These are the Yellow Stone National Park Sequencing project (Innskeep et al.2013) which has 21 samples and a wide pH range, as well as the best salinity gradient of a saltern to date in Fernandez et al.2014

**Types of samples include:**
Acidic salt lakes, Chaotrophic brines, Deepsea, Estuary, Fresh water, Gletsjer water, Groundwater, Hot spring water, Hydrothermal water, River water, Salt lake, Saltern, Sea/Ocean water, and Wastewater


**Data prep contains the R studio visualization of the selected files.** 
It shows the distribution of each site across a pH and Salinity % (w/v)
  This is then manually edited to include all the data found in the respective supplementary data of each study to include:                    (this is done manually since supplementary file format can differ (PDF, Docx, excel) and units differ as well (Especially Ion concentrations and Salinity)
      pH, Salinity, Na, K, Temperature and their BioProject/IMAG/MG-RAST Sequence Read Archive (SRA) annotation
      Acceptable units of salinity include % (w/v), psu, mS/cm, S/m, uS/cm and ppt. Preference is for psu, ppt and % (w/v)
      If these values are missing an approximation can be made using the Cl- concentration as a rough approximation using 1.8x multiplication
      If a seawater sample is taken but ion concentrations are in g/kg it will be converted to g/L using a density of 1.034 to account for additional salts in the water.
