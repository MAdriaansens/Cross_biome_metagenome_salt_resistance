#!/bin/bash
#SBATCH --job-name=perl
#SBATCH --time=48:00:00      # Walltime (HH:MM:SS
#SBATCH --mem=9000MB          # Memory in MB
#SBATCH --cpus-per-task=5
#SBATCH --account=uc04105 
#SBATCH --output=slurm_output/python_output%A.out
#SBATCH --error=slurm_output/python_errror%A.err

module load Python/3.11.6-foss-2023a

python download_pfam.py
