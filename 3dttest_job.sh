#!/bin/bash

#SBATCH --time=04:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16384M  # memory per CPU core
#SBATCH -J "GroupReg"  # job name

# Compatibility variables for PBS. Delete if not needed.
export PBS_NODEFILE=`/fslapps/fslutils/generate_pbs_nodefile`
export PBS_JOBID=$SLURM_JOB_ID
export PBS_O_WORKDIR="$SLURM_SUBMIT_DIR"
export PBS_QUEUE=batch

# Set the max number of threads to use for programs using OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

###############
#ENVIRONMENTAL#
###############


AFNI_BIN=/fslhome/ben88/abin


###########
#VARIABLES#
###########

HOME_DIR=/fslhome/ben88/compute/Reading
    workDir=$HOME_DIR/mriData
TEMPLATE=/fslhome/ben88/templates/Cthulhu
GROUP=$HOME_DIR/results/oculomotor


#mkdir Group_Analysis/whatever the analysis is
if [ ! -d $GROUP ]
    then
        mkdir -p $GROUP
fi

cd $GROUP

# perform the T-test
$AFNI_BIN/3dttest++ \
-Clustsim \
-prefix fixations \
-mask $TEMPLATE/fractionize+tlrc.BRIK.gz \
-setA fix-cross \
Luke_Reading_S1 ${workDir}/Luke_Reading_S1/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S2 ${workDir}/Luke_Reading_S2/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S3 ${workDir}/Luke_Reading_S3/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S4 ${workDir}/Luke_Reading_S4/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S5 ${workDir}/Luke_Reading_S5/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S6 ${workDir}/Luke_Reading_S6/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S7 ${workDir}/Luke_Reading_S7/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S8 ${workDir}/Luke_Reading_S8/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S9 ${workDir}/Luke_Reading_S9/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S11 ${workDir}/Luke_Reading_S11/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S12 ${workDir}/Luke_Reading_S12/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S13 ${workDir}/Luke_Reading_S13/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S14 ${workDir}/Luke_Reading_S14/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S16 ${workDir}/Luke_Reading_S16/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S17 ${workDir}/Luke_Reading_S17/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S18 ${workDir}/Luke_Reading_S18/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S19 ${workDir}/Luke_Reading_S19/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S20 ${workDir}/Luke_Reading_S20/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S22 ${workDir}/Luke_Reading_S22/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S23 ${workDir}/Luke_Reading_S23/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S24 ${workDir}/Luke_Reading_S24/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S25 ${workDir}/Luke_Reading_S25/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S26 ${workDir}/Luke_Reading_S26/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S27 ${workDir}/Luke_Reading_S27/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S28 ${workDir}/Luke_Reading_S28/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S29 ${workDir}/Luke_Reading_S29/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S30 ${workDir}/Luke_Reading_S30/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S31 ${workDir}/Luke_Reading_S31/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S33 ${workDir}/Luke_Reading_S33/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S35 ${workDir}/Luke_Reading_S36/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S36 ${workDir}/Luke_Reading_S37/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S37 ${workDir}/Luke_Reading_S38/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S45 ${workDir}/Luke_Reading_S45/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S47 ${workDir}/Luke_Reading_S47/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S48 ${workDir}/Luke_Reading_S48/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S50 ${workDir}/Luke_Reading_S50/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S51 ${workDir}/Luke_Reading_S51/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S52 ${workDir}/Luke_Reading_S52/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S54 ${workDir}/Luke_Reading_S54/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S55 ${workDir}/Luke_Reading_S55/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]' \
Luke_Reading_S56 ${workDir}/Luke_Reading_S56/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[1]'


$AFNI_BIN/3dttest++ \
-Clustsim \
-prefix saccades \
-mask $TEMPLATE/fractionize+tlrc.BRIK.gz \
-setA sac \
Luke_Reading_S1 ${workDir}/Luke_Reading_S1/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S2 ${workDir}/Luke_Reading_S2/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S3 ${workDir}/Luke_Reading_S3/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S4 ${workDir}/Luke_Reading_S4/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S5 ${workDir}/Luke_Reading_S5/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S6 ${workDir}/Luke_Reading_S6/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S7 ${workDir}/Luke_Reading_S7/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S8 ${workDir}/Luke_Reading_S8/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S9 ${workDir}/Luke_Reading_S9/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S11 ${workDir}/Luke_Reading_S11/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S12 ${workDir}/Luke_Reading_S12/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S13 ${workDir}/Luke_Reading_S13/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S14 ${workDir}/Luke_Reading_S14/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S16 ${workDir}/Luke_Reading_S16/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S17 ${workDir}/Luke_Reading_S17/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S18 ${workDir}/Luke_Reading_S18/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S19 ${workDir}/Luke_Reading_S19/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S20 ${workDir}/Luke_Reading_S20/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S22 ${workDir}/Luke_Reading_S22/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S23 ${workDir}/Luke_Reading_S23/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S24 ${workDir}/Luke_Reading_S24/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S25 ${workDir}/Luke_Reading_S25/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S26 ${workDir}/Luke_Reading_S26/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S27 ${workDir}/Luke_Reading_S27/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S28 ${workDir}/Luke_Reading_S28/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S29 ${workDir}/Luke_Reading_S29/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S30 ${workDir}/Luke_Reading_S30/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S31 ${workDir}/Luke_Reading_S31/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S33 ${workDir}/Luke_Reading_S33/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S35 ${workDir}/Luke_Reading_S36/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S36 ${workDir}/Luke_Reading_S37/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S37 ${workDir}/Luke_Reading_S38/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S45 ${workDir}/Luke_Reading_S45/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S47 ${workDir}/Luke_Reading_S47/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S48 ${workDir}/Luke_Reading_S48/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S50 ${workDir}/Luke_Reading_S50/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S51 ${workDir}/Luke_Reading_S51/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S52 ${workDir}/Luke_Reading_S52/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S54 ${workDir}/Luke_Reading_S54/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S55 ${workDir}/Luke_Reading_S55/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]' \
Luke_Reading_S56 ${workDir}/Luke_Reading_S56/afni_data/oculomotor/oculomotor_deconv_blur5_ANTS_resampled+tlrc'[3]'

cd ${workDir}

clear
clear

