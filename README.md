
# Jupyter in SLURM

These bash scripts will help you run Jupyter Notebook or JupyterLab in compute nodes of HPC clusters with SLURM workload manager.

Execute the `run_jupyter.sh` file after making the necessary changes in `submit.sh`. 

Find the detailed instructions below.




### submit.sh

- `submit.sh` is the SLURM job file, you can change the SLURM options by editing the following section.
```bash
#SBATCH --job-name=Notebook
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --time=02:00:00
#SBATCH --output=Jupyter-%j.out
```
- Changing the name of the output file is not recommended, if you do so, make necessary changes in the `run_jupyter.sh` file.
- Load the necessary modules. By default, the script will try to load Anaconda; you can change this and activate conda environments if needed.
```bash
module load anaconda 
conda activate env_name
```
- Change the `PUB_ADDRESS` variable to the public address of your login node. For example:
```bash
PUB_ADDRESS=192.168.100.100
```
OR
```bash
PUB_ADDRESS=login_node.cluster.univ.edu
```
- By default, the code runs JupyterLab. If you want to run Notebook, make changes in the following section.
```bash
jupyter-lab --no-browser --port=$PORT --ip=0.0.0.0
#jupyter-notebook --no-browser --port=$PORT --ip=0.0.0.0
```

### run_jupyter.sh

- `run_jupyter.sh` will submit the SLURM job file and output the code strings needed to run Jupyter.
- Once you execute the `run_jupyter.sh`, it will output the `ssh` command and the URL to JupyterLab.
- Copy and paste the ssh command to a local terminal.
- Copy and paste the link to your browser.

Please open an issue if you run into any problems.
