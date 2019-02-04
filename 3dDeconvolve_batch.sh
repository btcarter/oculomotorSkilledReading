#!/bin/bash

#######################################
#PREPROCESSING BATCH SUBMISSION SCRIPT#
#######################################

#Written by Ben Carter 01/10/2017

#############
#ENVIRONMENT#
#############

HOME_DIR=/fslhome/ben88/compute/Reading
SCRIPT_DIR=${HOME_DIR}/analyses/oculomotor
subj_DIR=${HOME_DIR}/mriData/${1}

##########
#COMMANDS#
##########

#Create logfiles directory
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var

#Submit the job script
for subj in $(ls ${SUBJ_DIR})
    do
    sbatch \
        -o ~/logfiles/${var}/output_${subj}.txt \
        -e ~/logfiles/${var}/error_${subj}.txt \
        ${SCRIPT_DIR}/oculomotor/3dDeconvolve_job.sh \
        ${subj}
        sleep 1
done
