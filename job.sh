#!/bin/bash
#SBATCH --job-name=test_polymatic
#SBATCH --mail-type=ALL
#SBATCH --ntasks 2
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=250mb
#SBATCH --account=jsampath
#SBATCH --time=1:00:00

# Change to this job's submit directory
cd $SLURM_SUBMIT_DIR
module load python
module load perl/5.20.0
module load intel/2019.1.144  openmpi/4.0.3 lammps/29Oct20
#

#Control parameters
dataFile=data.lmps
typesFile=types.txt
polymFile=polym.in
bondsTotal=49
bondsCycle=5
mdCycle=3
mdBond=6
mdMax=500

# Script files
path=/blue/jsampath/alotmi.m/HPG_polymatic
loopRun=$path/polym_loop.py
input_polym =$path/scripts/polym.in
input_min = $path/scripts/min.in
input_md0 = $path/scripts/md0.in
input_md1 = $path/scripts/md1.in
input_md2 = $path/scripts/md2.in

# Polymatic Scripts
script_step = $path/scripts/polym.pl
script_init = $path/scripts/polym_init.pl
script_final = $path/scripts/polym_final.pl

# Export variables
#
# Start Job
#

echo -e "Job started on $(hostname) at $(date)\n"

# Setup data and types file
# Start polymerization loop
bash $loopRun
if [[ $? -ne 0 ]]; then
	echo "polym_loop.py: Job did not complete properly."
	exit 2
fi

echo -e "\nJob ended at $(date)\n"
exit
