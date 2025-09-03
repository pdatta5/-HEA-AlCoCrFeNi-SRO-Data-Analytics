#!/bin/bash
#SBATCH -A TG-CTS170020           # Allocation account
#SBATCH -J Al0.3Co1.7CrFeNi_FCC        # Job name
#SBATCH -N 1                      # Number of nodes
#SBATCH --ntasks-per-node=48      # Number of tasks per node
#SBATCH -p skx                    # Partition (adjust to the correct partition)
#SBATCH -t 2:00:00               # Runtime (48 hours)

# Navigate to the LAMMPS input directory
cd /home1/10183/pdatta/New_Four_element_simulations/AlCoCrFe/BCC/Al1.6CoCrFe

# Run LAMMPS using ibrun
ibrun /home1/10183/pdatta/lammps-29Aug2024/src/lmp_mpi -in create_atoms_Al0.3Co1.7CrFeNi_FCC.in
