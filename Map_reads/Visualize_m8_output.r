---
title: "Untitled"
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

```{r}
Subset85 <- read.delim('/nesi/nobackup/uc04105/cross_biome_metagenome/Intermediate_SRA_download_Feb2_vsCPA.tsv', sep='\t', stringsAsFactors = TRUE)
```

```{r}
library(ggplot2)

ggplot(data = Subset85, aes(x=pH, y=salinity, colour = Description)) + geom_point()
```


```{r}
library(plyr)

srr_info <- unique(Subset85[,c(2, 4:8)])

merged_counts <- aggregate(. ~ Subset85$SRA_name, data=Subset85[,c(3,9:18)], FUN=sum)

colnames(merged_counts)[1] <-"SRA_name"

merged<-merge(srr_info, merged_counts, by ='SRA_name')
merged$ratio_CPA <- merged$total_CPA/merged$read_count
merged$ratio_CPA1 <- merged$count_CPA1/merged$read_count
merged$ratio_CPA2 <- merged$count_CPA2/merged$read_count
merged$ratio_Kef <- merged$count_Kef/merged$read_count
merged$ratio_NhaA <- merged$count_NhaA/merged$read_count
merged$ratio_NhaS5 <- merged$count_Nha/merged$read_count

merged$ratio_Unc <- merged$count_Unc/merged$read_count
merged$ratio_UncPseudomonadota <- merged$count_UncPseudomonadota/merged$read_count
merged$ratio_UncGammaproteo <- merged$count_UncGammaproteobacteriota/merged$read_count
merged$ratio_UncArc <- merged$count_UncArc/merged$read_count

merged_excluded <- merged[-c(20,21,35),]
merged.long <- merged_excluded  %>% 
  select("salinity","ratio_CPA1", "ratio_CPA2", "ratio_Kef", "ratio_NhaA", "ratio_NhaS5", "ratio_Unc", "ratio_UncPseudomonadota", "ratio_UncGammaproteo", "ratio_UncArc") %>% 
  pivot_longer(-salinity, names_to = "Type_CPA", values_to = "value")

head(merged.long)
ggplot(merged.long, aes(salinity, value, colour = Type_CPA)) + geom_point() +geom_smooth(se = FALSE) + geom_line(linetype = "dotted")

```

```{r}
merged.long <- merged_excluded  %>% 
  select("salinity","ratio_CPA" ,"ratio_CPA1", "ratio_CPA2", "ratio_Kef", "ratio_NhaA", "ratio_NhaS5", "ratio_Unc", "ratio_UncPseudomonadota", "ratio_UncGammaproteo", "ratio_UncArc") %>% 
  pivot_longer(-salinity, names_to = "Type_CPA", values_to = "value")

ggplot(merged.long, aes(salinity, value, colour = Type_CPA)) + geom_point() +geom_smooth(se = FALSE) + geom_line(linetype = "dotted")
```


```{r}
merged.long <- merged_excluded  %>% 
  select("pH","Description", "ratio_CPA1", "ratio_CPA2", "ratio_Kef", "ratio_NhaA", "ratio_NhaS5", "ratio_Unc", "ratio_UncPseudomonadota", "ratio_UncGammaproteo", "ratio_UncArc") %>% 
  pivot_longer(-c(pH, Description), names_to = "Type_CPA", values_to = "value")

ggplot(merged.long, aes(pH, value, colour = Type_CPA)) + geom_point()  + geom_line()
ggplot(merged.long, aes(pH, value, colour = Type_CPA)) + geom_point() +geom_smooth(se = FALSE) + geom_line(linetype = "dotted")

merged.long <- merged_excluded  %>% 
  select("pH","ratio_CPA" ,"ratio_CPA1", "ratio_CPA2", "ratio_Kef", "ratio_NhaA", "ratio_NhaS5", "ratio_Unc", "ratio_UncPseudomonadota", "ratio_UncGammaproteo", "ratio_UncArc") %>% 
  pivot_longer(-pH, names_to = "Type_CPA", values_to = "value")
ggplot(merged.long, aes(pH, value, colour = Type_CPA)) + geom_point()  + geom_line()
ggplot(merged.long, aes(pH, value, colour = Type_CPA)) + geom_point() +geom_smooth(se = FALSE) + geom_line(linetype = "dotted")
```

```{r}
ggplot(merged[merged$Description != 'Undersea_vent',], aes(y=ratio_CPA1, x=Description, fill=Description)) + geom_boxplot(outlier.alpha = 0)+ geom_point(alpha=0.6) + ggtitle('Best models and their score from Seed') + theme(axis.title.y = element_text(color = "black", size = 15, angle =90, hjust = .5, vjust = .5, face = "bold"), axis.title.x = element_text(color = "black", size = 15, angle = 0, hjust = .5, vjust = .5, face = "bold")) +  theme(plot.title = element_text(size = 10, face = "bold"))

ggplot(merged[merged$Description != 'Undersea_vent',], aes(y=ratio_CPA, x=Description, fill=Description)) + geom_boxplot(outlier.alpha = 0)+ geom_point(alpha=0.6) + ggtitle('CPA ratios of different aquatic microbiomes') + theme(axis.title.y = element_text(color = "black", size = 15, angle =90, hjust = .5, vjust = .5, face = "bold"), axis.title.x = element_text(color = "black", size = 15, angle = 0, hjust = .5, vjust = .5, face = "bold")) +  theme(plot.title = element_text(size = 10, face = "bold"))

ggplot(merged[merged$Description != 'Undersea_vent',], aes(y=ratio_Kef, x=Description, fill=Description)) + geom_boxplot(outlier.alpha = 0)+ geom_point(alpha=0.6) + ggtitle('Best models and their score from Seed') + theme(axis.title.y = element_text(color = "black", size = 15, angle =90, hjust = .5, vjust = .5, face = "bold"), axis.title.x = element_text(color = "black", size = 15, angle = 0, hjust = .5, vjust = .5, face = "bold")) +  theme(plot.title = element_text(size = 10, face = "bold"))


ggplot(merged[merged$Description != 'Undersea_vent',], aes(y=ratio_UncArc, x=Description, fill=Description)) + geom_boxplot(outlier.alpha = 0)+ geom_point(alpha=0.6) + ggtitle('Best models and their score from Seed') + theme(axis.title.y = element_text(color = "black", size = 15, angle =90, hjust = .5, vjust = .5, face = "bold"), axis.title.x = element_text(color = "black", size = 15, angle = 0, hjust = .5, vjust = .5, face = "bold")) +  theme(plot.title = element_text(size = 10, face = "bold"))
```

