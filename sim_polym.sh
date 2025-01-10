#!/bin/bash
#SBATCH --job-name=Polymatic
#SBATCH --mail-type=ALL
#SBATCH --ntasks 32
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=250mb
#SBATCH --account=jsampath
#SBATCH --time=12:00:00



ml gcc/12.2.0 openmpi/4.1.5
ml gsl/2.7
ml lammps/02Aug23


module load python/3.8 perl

# Script files
python polym_loop.py
