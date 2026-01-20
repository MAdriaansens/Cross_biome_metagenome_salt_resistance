---
title: "Make_data_sets_mags"
author: "Mick Adriaansens"
date: "`r Sys.Date()`"
output: html_document
editor_options: 
  chunk_output_type: console
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r Preciado et al.2024}
# https://www.nature.com/articles/s41559-024-02505-6
# Create vectors for each column
Site <- c("WCL3", "WCL2", "9Gt", "Ass","9Ass" )
Description <- c("Chaotrophic brine", "Chaotrophic brine", "Chaotrophic brine", "Chaotrophic brine", "Chaotrophic brine")
Study <- c("Preciado24","Preciado24", "Preciado24","Preciado24","Preciado24")
pH <- c(4.9, 5, 5.9, 6.6, 6.7)
Salinity <- c(41.2, 33.8, 32.5, 36, 30.2)

# Combine vectors into a dataframe
Preciado <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```



```{r Johnson et al.2015}
# https://pmc.ncbi.nlm.nih.gov/articles/PMC4414474/

# https://www.nature.com/articles/s41559-024-02505-6
# Create vectors for each column
Site <- c("Lake Yilgarn" )
Description <- c("Acidic brine")
Study <- c("Joshnson15")
pH <- c(3.6)
Salinity <- c(46)

# Combine vectors into a dataframe
Johnson<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Kim et al.2025}
# https://www.nature.com/articles/s41597-025-05569-6
# Create vectors for each column
Site <- c("April2014_1", "April2014_50","Jul2014_1","Jul2014_50","Oct2014_1","Oct2014_50","Jan2015_1", "Jan2015_50","Jan2019_1","Jan2015_10","Jan2015_20","Jan2015_40","Jan2015_90","April2019_1","April2015_10","April2015_20","April2015_40","April2015_90","Jul2019_1","Jul2015_10","Jul2015_20","Jul2015_40","Jul2015_90","Nov2019_1","Nov2015_10","Nov2015_20","Nov2015_40","Nov2015_90")
Description <- c("Lake", "Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake", "Lake","Lake","Lake")
Study <- c("Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24","Kim24")
pH <- c(7.9, 7.2, 8.4, 7.1, 7.1, 6.7, 6.9, 6.9, 6.8, 6.5, 6.5, 6.5, 6.8, 7.4, 7.4, 7.4, 7.4, 7.2, 8.9, 7.9, 7.1, 7.5, 7.0, 6.7, 6.8, 6.8, 6.4, 6.6)

Salinity <- c(0.003,0.003,0.003,0.003,0.0013,0.004,0.004,0.004, 0.005, 0.006, 0.006, 0.006, 0.008, 0.005,0.005,0.005,0.005,0.005,0.004,0.004,0.004,0.004,0.004, 0.003, 0.003, 0.003, 0.003, 0.003)

# Combine vectors into a dataframe
Kim<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```

```{r Tee et al.2021}
# https://link.springer.com/article/10.1186/s40168-021-01145-3#Sec25
# Create vectors for each column
Site <- c("FS1", "FS2","FS3","FS4","FS5","FS6","FS7", "FS8","FS9")
Description <- c("River", "River", "Estuary","Estuary","Estuary","Estuary","Estuary", "Ocean", "Ocean")
Study <- c("Tee21","Tee21","Tee21","Tee21","Tee21","Tee21","Tee21","Tee21","Tee21")
pH <- c(7.29, 7.25, 7.2, 7.26, 7.42, 7.37, 7.57, 7.57, 7.55)
Salinity <- c(0.032, 0.03, 0.85, 2, 2.4, 2.12, 2.63, 3.28, 3.49)

# Combine vectors into a dataframe
Tee <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```



```{r Soufi et al.2024}
#https://enviromicro-journals.onlinelibrary.wiley.com/doi/epdf/10.1111/1462-2920.16578

Site <- c("BSL10", "BSL30", "BSL40", "BSL60", "LSL10", "LSL12")
Description <- c("Soda_lake", "Soda_lake", "Soda_lake" ,"Soda_lake", "Soda_lake","Soda_lake")
Study <- c("Soufi2024", "Soufi2024", "Soufi2024", "Soufi2024", "Soufi2024", "Soufi2024")
pH <- c(9.77, 9.85, 9.87, 9.77, 9.15, 9.15)
Salinity <- c(1.4, 1.4, 1.4, 5.1, 8.6, 8.5)

# Combine vectors into a dataframe
Soufi <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Wu2024}

#https://doi.org/10.1186/s40168-024-01817-w

# Create vectors for each column
Site <- c("PR5", "PR2","PR3","PR4","PR5","PR6","PR7", "PR9","PR10")
Description <- c("River", "River", "River", "River","Estuary","Estuary","Estuary", "Ocean", "Ocean")
Study <- c("Wu24","Wu24","Wu24","Wu24","Wu24","Wu24","Wu24","Wu24","Wu24")
pH <- c(7.48, 7.53, 7.25, 7.16, 7.93, 8.63, 8, 8.03, 8.03)
Salinity <- c(0.012, 0.013, 0.017, 0.036, 1.562, 2.564, 2.89, 3.117, 3.117)

# Combine vectors into a dataframe
Wu <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Anantharaman2016}
#https://academic.oup.com/ismej/article/10/1/225/7538115
#estimated from cl- data *1.8 https://rwu.pressbooks.pub/webboceanography/chapter/5-3-salinity-patterns/

Site <- c("AbeA1", "MA1","KM1","Oceanwater")
Description <- c("Undersea_vent", "Undersea_vent", "Undersea_vent", "Ocean")
Study <- c("Anantharaman2016","Anantharaman2016","Anantharaman2016","Anantharaman2016")
pH <- c(4.3, 2.5, 3.6, 8)
Salinity <- c(3.4, 3.98, 3.70,3.45)
Anantharaman<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Michoud2021}
#https://www.nature.com/articles/s41396-021-00931-z#Sec19

Site <- c("N5F8", "N4F7", "N5F5", "NF4F5", "N4F4", "N4F3", "N7F9", "N4F2", "N7F6", "N7F1", "BODY")
Description <- c("Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea", "Deepsea")
Study <- c("Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021", "Michoud2021")
pH <- c(7.9, 7.89, 7.73, 7.56, 7.27, 7.14, 7.22, 7.15, 7.18, 7.39, 7.59)
Salinity <- c(4.01, 4.17, 4.79, 7.09, 9.68, 11.78, 11.72, 12.47, 12.933, 13.93, 14.9)
Michoud2021<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Chen2022}
#https://pmc.ncbi.nlm.nih.gov/articles/PMC9563475/
#estimated from cl- data *1.8 https://rwu.pressbooks.pub/webboceanography/chapter/5-3-salinity-patterns/

Site <- c("HQ_Aug_2017", "HQ_June_2018","HQ_June_2019", "BQ_Aug_2017", "BQ_June_2018","BQ_June_2019")
Description <- c("Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent")
Study <- c("Chen2022","Chen2022","Chen2022","Chen2022","Chen2022","Chen2022")
pH <- c(5.25, 5.43, 1.63, 5.35, 5.74, 5.64)
Salinity <- c(3.16, 3.26, 3.64, 3.359, 3.439, 3.236)
Chen<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Vavourakis2016}
#https://www.frontiersin.org/journals/microbiology/articles/10.3389/fmicb.2016.00211/full
Site <- c("Lake_T5", "PL", "Tc", "Lake_B1")
Description <- c("Soda_lake", "Soda_lake","Soda_lake", "Soda_lake")
Study <- c("Vavourakis2016","Vavourakis2016","Vavourakis2016","Vavourakis2016")
pH <- c(9.9, 9.5, 9.9, 10.2)
Salinity <- c(17,25,30,40)

# Combine vectors into a dataframe
Vavourakis<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r He2021}
#https://www.nature.com/articles/s41564-020-00840-5#Sec25
Site <- c("Pr6_gw", "Pr4_gw", "Pr3_gw", "Pr1_gw")
Description <- c("Groundwater", "Groundwater","Groundwater", "Groundwater")
Study <- c("He2021","He2021","He2021","He2021")
pH <- c(8.3, 8, 8.2, 8.1)
Salinity <- c(0.0006, 0.0007, 0.0006, 0.007)

# Combine vectors into a dataframe
He<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Allioux2022}
#https://www.nature.com/articles/s41598-022-26299-4
Site <- c("Rb108", "Rb13", "Rb10", "Rb32")
Description <- c("Hot spring", "Hot spring","Hot spring", "Hot spring")
Study <- c("He2021","He2021","He2021","He2021")
pH <- c(9.59, 7.61, 8.7, 5.79)
Salinity <- c(0.102, 0.0014, 0.0013, 0.00055)

# Combine vectors into a dataframe
Allioux<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Ramos-Barbero2021}
#https://enviromicro-journals.onlinelibrary.wiley.com/doi/10.1111/1462-2920.156304
Site <- c("HU", "HP", "SE")
Description <- c("Saltern", "Saltern","Saltern")
Study <- c("Ramos-Barbero2021","Ramos-Barbero2021","Ramos-Barbero2021")
pH <- c(7.34, 6.68, 6.68)
Salinity <- c(24, 23, 23.8)

# Combine vectors into a dataframe
RamosBarbero<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```



```{r Garcia-Roldan2023}
#https://doi.org/10.1038/ismej.2011.78
Site <- c("Isla_cristina")
Description <- c("Saltern")
Study <- c("Garcia_roldan2023")
pH <- c(6.7)
Salinity <- c(42)

# Combine vectors into a dataframe
GarciaRoldan<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```



```{r Ghai2011}
#https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0023785#pone.0023785.s006
Site <- c("River_upper_brazil")
Description <- c("River" )
Study <- c("Ghai2011")
Salinity <- c(0.0056)
pH <- c(7.09)


# Combine vectors into a dataframe
Ghai<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Fernandez_2014}
#https://academic.oup.com/femsec/article/88/3/623/587048?login=true
Site <- c("SS37","SS19", "SS13", "MM5", "DCM3")
Description <- c("Saltern","Saltern", "Saltern", "Saltern", "Saltern" )
Study <- c("Ghai2011","Ghai2011", "Fernandez2014","Ghai2012", "Ghai2010")
Salinity <- c(37, 19, 13, 5, 3.8)
pH <- c(7.1, 8, 8, 8.4, 8.1)

#ghai 2010 https://academic.oup.com/ismej/article/4/9/1154/7588139
#ghai 2011 https://www.nature.com/articles/srep00135
#ghai 2012 https://www.nature.com/articles/srep00490


# Combine vectors into a dataframe
Fernandez<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Michoud2025}
#https://www.nature.com/articles/s41564-024-01874-9#Fig7

Site <- c("Gl127_u_KZ","Gl114_u_Nepal","Gl130_u_KZ","Gl100_u_Alp","Gl140_2_Ug","Gl22_u_Alp","Gl106_u_Nep","Gl86_u_Norway","Gl103_u_Nepal","Gl133_u_KZ","Gl54_u_Caucasus","Gl81_u_Alp","Gl116_u_Nepal","Gl122_u_KZ","Gl99_u_Alp","Gl124_u_KZ","Gl73_u_Ecuador","Gl88_u_NZ","Gl74_u_Ecuador","Gl75_u_Ecuador","Gl36_u_Greenland","Gl91_u_Norway", "Gl99_u_NZ")
Description <- c("Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer","Gletsjer")
Study <- c("Michoud2025", "Michoud2025", "Michoud2025", "Michoud2025" ,"Michoud2025" ,"Michoud2025", "Michoud2025" ,"Michoud2025" ,"Michoud2025", "Michoud2025", "Michoud2025", "Michoud2025", "Michoud2025", "Michoud2025", "Michoud2025" , "Michoud2025", "Michoud2025" ,"Michoud2025" ,"Michoud2025" ,"Michoud2025" ,"Michoud2025" ,"Michoud2025","Michoud2025")
pH <- c(8.204, 8.262, 8.33, 7.8, 6.94, 9.24, 7.66, 8.32, 7.92, 9.14, 7.91, 8.59, 9.106, 8.92, 7.4, 9.819, 5.08, 7.18, 4.9, 4.42, 6.06, 6.65, 10.18)
Salinity <- c(0.0115, 0.0045, 0.0288, 0.0024, 0.0036, 0.00162, 0.492, 0.159, 0.0045, 0.0014, 0.0061, 0.0013, 0.0038, 0.0016, 0.0014, 0.0012, 0.0012, 0.0012,0.0012,0.0012,0.0012,0.0012, 0.0016)

Michoud2025<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```


```{r Inskeep2013_YNSP_metagenome}
#https://www.frontiersin.org/journals/microbiology/articles/10.3389/fmicb.2013.00067/full
Site <- c("YNP_009", "YNP_0141", "YNP_010", "YNP_012", "YNP_011", "YNP_013", "YNP_01", "YNP_02", "YNP_03", "YNP_19", "YNP_04", "YNP_18", "YNP_08", "YNP_14", "YNP_05", "YNP_020", "YNP_06", "YNP_07", "YNP_015", "YNP_016", "YNP_017")
Description <- c("Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring", "Hot spring")
Study <- c("Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013","Inskeep2013")
pH <- c(3.1, 3.5, 6.5, 7.8, 7.9, 7.8, 2.5, 4.2, 4, 4.4, 6.1, 6.4, 3.3, 3.5, 6.2, 6.2, 8.2, 6, 8, 9.1, 5.7)
Salinity <- c(0.081, 0.082, 0.028, 0.041, 0.041, 0.012, 0.002, 0.025, 0.06, 0.087, 0.055, 0.002, 0.088, 0.082, 0.027, 0.035, 0.012, 0.005, 0.045, 0.032, 0.055)

# Combine vectors into a dataframe
YNSP<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Xamxidin}
#https://www.frontiersin.org/journals/microbiology/articles/10.3389/fmicb.2025.1550346/full
Site <- c("W_1", "W_4", "W_8")
Description <- c("Salt lake", "Salt lake", "Salt lake")
Study <- c("Xamxidin2025","Xamxidin2025", "Xamxidin2025")
pH <- c(8.18, 8.02, 8.11)
Salinity <- c(15.4, 20.2, 15.9)

# Combine vectors into a dataframe
Xamxidin<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Jungbluth}
#https://www.nature.com/articles/ismej2015248#Sec11


Site <- c("U1362A_SSF19", "U1362B_SSF18")
Description <- c("Groundwater", "Groundwater")
Study <- c("JUngbluth2016","Jungbluth2016")
pH <- c(7.3, 7.5)
Salinity <- c(3.39, 3.39)

# Combine vectors into a dataframe
Jungbluth<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Yang2024}

#https://pmc.ncbi.nlm.nih.gov/articles/PMC11153410/#Sec2


Site <- c("S5_1", "S5_2", "S5_3", "S6_1" ,"S6_2","S6_3", "S7_1", "S7_3")
Description <- c("Estuary", "Estuary", "Estuary", "Estuary", "Estuary", "Estuary", "Seawater", "Seawater")
Study <- c("Yang2024","Yang2024","Yang2024","Yang2024", "Yang2024","Yang2024", "Yang2024","Yang2024")
pH <- c(8.01, 8, 8.02, 8.06, 8.02, 8.04, 7.95, 7.93)
Salinity <- c(0.58, 0.516, 0.506, 1.521, 1.509, 1.506, 3.010, 3.011)

# Combine vectors into a dataframe
Yang<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```

```{r Guardia-leiva et al.2023}
#https://pmc.ncbi.nlm.nih.gov/articles/PMC10143455/#notes2

Site <- c("BacS1", "BacS2", "BacS3")
Description <- c("Estuary", "Estuary", "Estuary")
Study <- c("Guardia-leiva2023","Guardia-leiva2023","Guardia-leiva2023")
pH <- c(7, 7, 7)
Salinity <- c(2.9, 2.3, 1.4)

# Combine vectors into a dataframe
GuardiaLeiva<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Ugwuanyi et al.2023}

#https://www.frontiersin.org/journals/microbiology/articles/10.3389/fmicb.2023.1066406/full#supplementary-material

Site <- c("PLP_W","SMP_Wb","SMP_Wa")
Description <- c("Hot spring","Hot spring", "Hot spring")
Study <- c("Ugwuanyi2023", "Ugwuanyi2023", "Ugwuanyi2023")
pH <- c(2.5, 1, 1)
Salinity <- c(0.0004878, 0.000468, 0.000486)

# Combine vectors into a dataframe
Ugwuanyi<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```

```{r Fang2024}

#https://www.sciencedirect.com/science/article/pii/S0269749124014982#da0010

Site <- c("X0.1","X1.1","X2.1" , "X3.1",  "X4.1")
Description <- c("Wastewater","Wastewater","Wastewater","Wastewater","Wastewater")
Study <- c("Fang2024","Fang2024","Fang2024","Fang2024", "Fang2024")
pH <- c(6.89, 6.86, 7.048, 7.087, 7.069)
Salinity <- c(0.0996,0.1001, 0.129, 0.1394, 0.1448)

# Combine vectors into a dataframe
Fang<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```

```{r Cabello-Yeves_et al.2021}
#https://link.springer.com/article/10.1186/s40793-021-00374-1#Sec18

Site <- c("St301_5m", "St307_5m", "St307_30", "St307_150m", "St307_750m")
Description <- c("Ocean", "Ocean", "Ocean" ,"Ocean", "Deepsea")
Study <- c("Cabello-Yeves2021", "Cabello-Yeves2021", "Cabello-Yeves2021", "Cabello-Yeves2021", "Cabello-Yeves2021")
pH <- c(8.36, 8.35, 8.28, 7.67, 7.63)
Salinity <- c(1.75, 1.80, 1.83, 2.087, 2.221)

# Combine vectors into a dataframe
CabelloYeves <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```



```{r Kheiri.2024}

#https://www.nature.com/articles/s41598-023-27429-2/tables/1
Site <- c("Location_1", "Location_2", "Location_3", "Location_4", "Location_5", "Location_6")
Description <- c("Salt lake", "Salt lake", "Salt lake" ,"Salt lake", "Salt lake","Salt lake")
Study <- c("Kheiri2023", "Kheiri2023", "Kheiri2023", "Kheiri2023", "Kheiri2023", "Kheiri2023")
pH <- c(8.9, 8.97, 8.96, 8.84, 8.94, 8.94)
Salinity <- c(25.5,25.5,25.4, 25.3, 25.4, 25.1)

# Combine vectors into a dataframe
Kheiri <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Kadnikov2020}

#https://www.frontiersin.org/journals/microbiology/articles/10.3389/fmicb.2020.572252/full
Site <- c("Borehole_5p")
Description <- c("Groundwater")
Study <- c("Kadnikov2020")
pH <- c(7.5)
Salinity <- c(0.586)

# Combine vectors into a dataframe
Kadnikov <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```


```{r Sierra2022}

#https://link.springer.com/article/10.1186/s40793-022-00455-9#Sec2
Site <- c("Lake Hillier")
Description <- c("Salt lake")
Study <- c("Sierra2022")
pH <- c(7.4)
Salinity <- c(28)

# Combine vectors into a dataframe
Sierra<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Maruyama2024}

#https://www.nature.com/articles/s41598-024-54614-8

# Create vectors for each column
Site <- c("Site1_nov2021", "Site1_Dec2021","Site1_Jan2022", "Site2_nov2021", "Site2_Dec2021","Site2_Jan2022", "Site3_nov2021", "Site3_Dec2021","Site3_Jan2022")
Description <- c("Groundwater", "Groundwater", "Groundwater", "Groundwater", "Groundwater", "Groundwater", "Groundwater", "Groundwater", "Groundwater")
Study <- c("Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024","Maryuma2024")
pH <- c(7.66, 6.82, 7.08, 6.8, 6.88, 7.03, 6.68, 7.25, 7.4)
Salinity <- c(0.0354, 0.353, 0.33, 0.452, 0.458, 0.481, 0.422,0.0189, 0.178)

# Combine vectors into a dataframe
Maryuma <- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Zepernick et al.2024}
#https://journals.asm.org/doi/10.1128/mra.00798-24
#conductivity https://www.bco-dmo.org/dataset/931936

Site <- c("LV_1", "LV_2", "LV_3", "LV_4","LV_5", "LV_6", "LV_7", "LV_8", "LV_9", "LV_10", "LV_11", "LV_12", "LV_13" , "LV_14", "LV_21" ,"LV_22", "LV_23" , "LV_25",  "LV_26" , "LV_27" , "LV_28" , "LV_29" , "LV_30",  "LV_31", "LV_32"  , "LV_33", "LV_34" , "LV_35" , "LV_36",  "LV_38",  "LV_39", "LV_40")
Description <- c("Lake", "Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake","Lake", "Lake","Lake","Lake","Lake", "Lake","Lake","Lake")
Study <- c("Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24","Zepernick24")
pH <- c(7.1, 7.1, 7.1, 7.1, 7.6, 7.6, 7.4, 7.4, 7.4, 7.4, 7.4, 7.4, 7.7, 7.7, 7.4, 7.4, 6.7, 8.5, 8.1, 7.1, 7.7, 8.7, 7.3, 8.7, 8.6, 8.6, 7.4, 8.3, 7.8, 7.8, 7.5, 8.7)

Salinity <- c(0.007, 0.007, 0.007, 0.007, 0.007, 0.007, 0.005, 0.005, 0.005, 0.005, 0.006, 0.006,  0.007, 0.007, 0.005, 0.005, 0.008, 0.004, 0.004,  0.005, 0.005, 0.005, 0.005,0.004,  0.005, 0.005, 0.005, 0.005,0.004, 0.004, 0.004, 0.006)

# Combine vectors into a dataframe
Zepernick<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)

```

```{r Tavares_Martins etal2025}

#https://journals.asm.org/doi/10.1128/aem.01470-24
Site <- c("IT1_A", "IT1_B", "IT1_C", "IT2_A", "IT2_B", "IT2_C", "I31_A", "IT3_B", "IT3_C", "IT4_A", "IT4_B","IT4_C")
Description <- c("River","River", "River", "River", "River", "River", "River", "River", "River", "River", "River", "River")
Study <- c("Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025","Tavares_Martins2025")
pH <- c(6.59, 6.96, 7.05, 6.84, 6.83, 6.85, 7.49, 7.35, 6.98, 7.52, 6.99,6.9)
Salinity <- c(0.0046,0.0046, 0.0046, 0.0046, 0.0047,0.0048, 0.0046,  0.0048, 0.0047, 0.0029,0.0047,0.0046) 

# Combine vectors into a dataframe
Tavares_Martins<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Sierra2022}

#https://link.springer.com/article/10.1186/s40793-022-00455-9#Sec2
Site <- c("Lake Hillier")
Description <- c("Salt lake")
Study <- c("Sierra2022")
pH <- c(7.4)
Salinity <- c(28)

# Combine vectors into a dataframe
Sierra<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Gionfriddo2020}

#https://journals.asm.org/doi/10.1128/aem.00176-20
Site <- c("Tiger bath", "Cub bath")
Description <- c("Hot spring", "Hot spring")
Study <- c("Gionfriddo","Gionfriddo")
pH <- c(2.95,3.4)
Salinity <- c(0.0054, 0.0854)

# Combine vectors into a dataframe
Gionfriddo<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Magnabasco et al.2015}
#https://www.nature.com/articles/ismej2015150#Ack1
Site <- c("Witwatersrand Basin")
Description <- c("Groundwater")
Study <- c("Magnabasco")
pH <- c(8.65)
Salinity <- c(0.0178)

# Combine vectors into a dataframe
Magnabasco<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Reysenbach2020}

#https://www.pnas.org/doi/10.1073/pnas.2019021117#supplementary-materials
Site <- c("S010", "S011", "S147", "S014", "S016", "S142", "S140", "S146", "S012", "S139", "S015")
Description <- c("Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent", "Undersea_vent")
Study <- c("Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020", "Reysenbach2020")
pH <- c(2.08, 2.21, 2.21, 5.66, 5.14, 6.55, 2.82, 3.61, 2.97, 2.97, 7.62)
Salinity <- c(3.116, 3.08, 3.08, 3.127, 3.089, 3.16, 3.58, 3.38, 4.06, 4.06, 3.13) 

# Combine vectors into a dataframe
Reysenbach<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Ghosh}

#https://peerj.com/articles/13169/
Site <- c("SBR_Stn2", "SBR_Stn3", "SBR_Stn5", "SBR_Stn6", "SBR_Stn7", "SBR_Stn33", "SBR_Stn57", "SBR_Stn58", "SBR_Stn93", "SBR_Stn113", "SBR_Stn223" )
Description <- c("Estuary","Estuary","Estuary","Estuary","Estuary","Estuary","Estuary","Estuary","Estuary","Estuary","Estuary")
Study <- c("Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22","Ghosh22")
pH <- c(7.57, 7.5, 7.54, 7.5, 7.5, 7.47, 7.54, 7.54,  7.38, 7.53, 7.29)
Salinity <- c(3.05, 3.05, 3.03, 3.02, 3.04, 2.93, 2.93, 2.96, 2.49, 2.88, 2.46) 

# Combine vectors into a dataframe
Ghosh<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r Parwin et al.2025}
#https://link.springer.com/article/10.1186/s44342-025-00054-3#Sec15
Site <- c("US", "MC", "DS")
Description <- c("River", "Wastewater", "Wastewater")
Study <- c("Parwin", "Parwin", "Parwin")
pH <- c(7, 7.7, 7.23)
Salinity <- c(0.0091, 0.0202, 0.0113)

# Combine vectors into a dataframe
Parwin<- data.frame(Site, Study, pH, Salinity, Description, stringsAsFactors = FALSE)
```

```{r pressure, echo=FALSE}
library(ggplot2)
combined_df <- bind_rows(Preciado,Gionfriddo,Ghosh,Magnabasco,Reysenbach, Tavares_Martins, GuardiaLeiva, Zepernick, Xamxidin,Jungbluth, Ghai, RamosBarbero,Chen, Michoud2025, Michoud2021,Yang, Sierra, Vavourakis,Allioux,Johnson,CabelloYeves,Tee,Kheiri,Kadnikov, YNSP,Soufi, Maryuma,Fang,Ugwuanyi, He,GarciaRoldan, Kim, Wu,Parwin, Anantharaman, Fernandez,  .id = "source")
# Make 'source' a factor for correct plotting if needed
combined_df$source <- factor(combined_df$source)


p<-ggplot(data = combined_df, aes(x = pH, y = Salinity, col=Description)) + geom_point(size=3) 
p + ggtitle('Metagenomic studies and their sampling sites at different pH and salinities')
```
