#!/bin/bash

#######################################
#PREPROCESSING BATCH SUBMISSION SCRIPT#
#######################################

#Written by Ben Carter 03/27/2017

#############
#ENVIRONMENT#
#############

HOME_DIR=/fslhome/ben88/compute/Reading/Compute_data
SCRIPT_DIR=${HOME_DIR}/Scripts
SUBJ_DIR=${HOME_DIR}/SubjData

##########
#COMMANDS#
##########

#Create logfiles directory
var=`date +"%Y%m%d-%H%M%S"`
mkdir -p ~/logfiles/$var

#Submit the job script
sbatch \
-o ~/logfiles/${var}/output_group_oculomotor.txt \
-e ~/logfiles/${var}/error_group_oculomotor.txt \
${SCRIPT_DIR}/oculomotor/3dttest_job.sh \
sleep 1
