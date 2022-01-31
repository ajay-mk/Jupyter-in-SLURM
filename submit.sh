#!/bin/bash

# SLURM Options - Make necessary chanages according to available resources and QOS settings of the cluster

#SBATCH --job-name=Notebook
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --time=02:00:00
#SBATCH --output=Jupyter-%j.out

# Loading modules and activating environments
# Loading Anaconda, this may vary according to your setup. Load which ever conda setup you are using
module load anaconda 

# Activate a specific conda environment
#conda activate env_name

#Getting the node name
NODE_NAME=$(hostname)

# Setting a random port for the notebook
PORT=`shuf -i 10000-11000 -n 1`

# Before running, change the ADRESS to the public adress of your login node
PUB_ADDRESS='login_node@cluster.univ.edu'

echo "ssh -N -f -L $PORT:$NODE_NAME:$PORT $(whoami)@$PUB_ADDRESS"

# Running Jupyter Lab or Jupyter Notebook
jupyter-lab --no-browser --port=$PORT --ip=0.0.0.0
#jupyter-notebook --no-browser --port=$PORT --ip=0.0.0.0

wait

# By Ajay (https://github.com/ajay-mk)
