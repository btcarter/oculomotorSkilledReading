#!/bin/sh

#SBATCH --time=06:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16384M  # memory per CPU core
#SBATCH -J "3dDeconOM"  # job name

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
HOME_DIR=/fslhome/ben88/compute/Reading
SCRIPT_DIR=${HOME_DIR}/analyses/oculomotor
antifyFunk=${SCRIPT_DIR}/ANTifyFunctional
subj_DIR=${HOME_DIR}/mriData/${1}
TIMING=${HOME_DIR}/timingFiles/oculomotor
TIMING_FIX=${TIMING}/fixations/${1}.txt
TIMING_SAC=${TIMING}/saccades/${1}.txt
TIMING_CROSS=${TIMING}/fixationCross/fixationCross.txt
TIMING_LING=${TIMING}/linguistic/${1}.txt
LOG=/fslhome/ben88/logfiles

##########
#COMMANDS#
##########

#  Created by Benjamin Carter on 03/20/2017.
#  This script performs Ordinary Least Square Regression of subject data using 3dDeconvolve from the AFNI software package.


cd $subj_DIR

if [ ! -d afni_data/oculomotor ]
    then
        mkdir afni_data/oculomotor
fi

cd afni_data/oculomotor

#####################
#REGRESSION ANALYSIS#
#####################


#3dDeconvolve
if [ -f ${TIMING_FIX} ] && [ ! -f oculomotor_deconv+orig.BRIK ]
    then
        ${AFNI_BIN}/3dDeconvolve \
            -input $subj_DIR/afni_data/epi1_volreg+orig $subj_DIR/afni_data/epi2_volreg+orig $subj_DIR/afni_data/epi3_volreg+orig \
            -mask $subj_DIR/afni_data/struct_mask+orig \
            -polort A \
            -num_stimts 10 \
            -stim_file 1 "$subj_DIR/motion/motion.txt[0]" -stim_label 1 "Roll"  -stim_base   1 \
            -stim_file 2 "$subj_DIR/motion/motion.txt[1]" -stim_label 2 "Pitch" -stim_base   2 \
            -stim_file 3 "$subj_DIR/motion/motion.txt[2]" -stim_label 3 "Yaw"   -stim_base   3 \
            -stim_file 4 "$subj_DIR/motion/motion.txt[3]" -stim_label 4 "dS"    -stim_base   4 \
            -stim_file 5 "$subj_DIR/motion/motion.txt[4]" -stim_label 5 "dL"    -stim_base   5 \
            -stim_file 6 "$subj_DIR/motion/motion.txt[5]" -stim_label 6 "dP"    -stim_base   6 \
            -stim_times_AM1 7 $(TIMING_LING) 'dmBLOCK' -stim_label 7 "ling" -stim_base 7 \
            -stim_times 8 ${TIMING_CROSS} 'BLOCK(6,1)' -stim_label 8 "cross" \
            -stim_times_AM1 9 ${TIMING_FIX} 'dmBLOCK' -stim_label 9 "fix" \
            -stim_times_AM1 10 ${TIMING_SAC} 'dmBLOCK' -stim_label 10 "sac" \
            -num_glt 3 \
            -gltsym 'SYM: fix -cross' \
            -glt_label 1 fix-cross \
            -gltsym 'SYM: sac' \
            -glt_label 2 sac \
            -gltsym 'SYM: sac -fix' \
            -glt_label 3 sac-fix \
            -censor "$subj_DIR/motion/motion_censor_vector.txt[0]" \
            -nocout \
            -tout \
            -bucket oculomotor_deconv \
            -xjpeg oculomotor_design.jpg \
            -jobs 2 \
            -GOFORIT 12
fi



#blur the output of the regression analysis
if [ -f oculomotor_deconv+orig.BRIK ] && [ ! -f oculomotor_deconv_blur5+orig.BRIK ]
    then
        ${AFNI_BIN}/3dmerge -prefix oculomotor_deconv_blur5 -1blur_fwhm 5.0 -doall oculomotor_deconv+orig
fi

#END
