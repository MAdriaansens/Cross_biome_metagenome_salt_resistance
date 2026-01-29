#!/usr/bin/env python
#not mine, copied from stack overflow

#what this does is that it counts the amount of bases in a fastqc file and outputs this in the slurm.
#this can be used to see how many reads per Kb are mapped to a certain gene. 

import sys
fastq = sys.argv[1]
with open(fastq, 'r') as f:
    reads = []
    for line in f:
        if line.startswith("@"):
            reads.append(line)
print("The total number of reads is: ", len(reads))
totalReads = len(reads)
bases = []
with open(fastq, 'r') as f:
    for line in f:
        if line.startswith("A") or line.startswith("T") or line.startswith("C") or line.startswith("G"):
            numBases = line.split()
            bases.append(numBases)
flatList = [item for sublist in bases for item in sublist] # split a list of lists into a single list
total = []
for i in flatList:
    totalBases = list(i)
    count = 0
    count += (len(totalBases))
    total.append(count)
allBases = sum(total)
print("The total number of bases is:", allBases)
