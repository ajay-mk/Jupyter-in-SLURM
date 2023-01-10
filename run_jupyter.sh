#!/bin/bash

# Written by Ajay Melekamburath (https://github.com/ajay-mk)
# See README.md before making changes

# Submitting the bash file
jobid=$(sbatch --parsable submit.sh)
echo "Submitting the job file"
logfile=Jupyter-$jobid.out

# Waitng for Jupyter to load and connet
while true ; do
    echo "Working..."
    sleep 5s
    if grep -q "token=" "$logfile"; then
        echo " "
        echo "Copy and paste the following command to your local terminal:"
        head -n 1 $logfile
        echo " "
        echo "Copy and paste either or links below to your browser:"
        tail -n 2 $logfile
        echo " "
        echo "To kill the job, use: scancel $jobid"
        echo " "
        break
    fi
    echo "Working..."
    sleep 2s
done

# EOF
