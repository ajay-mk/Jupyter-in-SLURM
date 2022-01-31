
# Jupyter in SLURM

JupyterLab and Jupyter Notebook are very useful tools for data scientists. If the workload is high, and you want to run your calculations in compute nodes of a HPC cluster, this script may be useful.

This bash scripts will help you run Jupyter Notebook or JupyterLab in compute nodes of HPC clusters with SLURM.

Execute the `run_jupyter.sh` file after making necessary changes in `submit.sh`. 

Find the detailed instructions below.




### submit.sh

- `submit.sh` is the slurm job file, you can change the SLURM options by editing the following section.
```bash
#SBATCH --job-name=Notebook
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --time=02:00:00
#SBATCH --output=Jupyter-%j.out
```
- Changing the name of the output file is not recommended, if you do so, make necessary changes in the `run_jupyter.sh` file.
- Load the necessary modules. By default the script will try to load anaconda, you can change this and activate conda environments if needed.
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
PUB_ADDRESS=login_node@cluster.univ.edu
```
- By default the code runs JupyterLab. If you want to run Notebook, make changes in the following section.
```bash
jupyter-lab --no-browser --port=$PORT --ip=0.0.0.0
#jupyter-notebook --no-browser --port=$PORT --ip=0.0.0.0
```

### run_jupyter.sh

- `run_jupyter.sh` will submit the slurm job file, and output the code strings needed to run Jupyter.
- Once you execute the `run_jupyter.sh`, it will output the ssh command and the url to JupyterLab.
- Copy and paste the ssh command to a local terminal.
- Copy and paste the link to your browser.
If this was helpful to you, I would appreciate a tweet. Raise an issue if you find a bug, or submit a PR.

-Ajay
