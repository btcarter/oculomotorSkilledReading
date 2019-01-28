# Oculomotor control during reading – an analysis of the Skilled Reading Project

## Study Aim

The purpose of this analyses is to explore the neural basis of saccade control – where the eyes move – during reading. In these analyses, functional activity immediately prior to an eye movement will be examined, in order to localize cortical areas associated with word skipping, word refixations, or regressive saccades back to earlier material, and to investigate cortical and sub-cortical regions associated with programming and executing saccades of different lengths. In these analyses, lexical and other factors known to influence eye movements will be included as dummy regressors.

## Code Contained in this repository

This repository contains the code used to examine the hemodynamic response associated with oculomotor control in skilled reading in the Skilled Reading Study. Scripts with the suffix <code>_batch.sh</code> reference scripts with the suffix <code>_job.sh</code> and executes them once per participant and are designed for the super computer environment. Job scripts contain the commands to be executed on the data.

## Outline of scripts and order of execution

<ol>
	<li>Code contained in the <code>hrfTiming</code> directory were executed first to construct theoretical hemodynamic profiles for baseline regressors and regressors of interest.
	</li>
		<ul><li>The HRF for the fixation cross was manually constructed since only one was needed for the entire group.</li></ul>
	<li><code>preproc_batch.sh</code> and <code>preproc_job.sh</code> – preprocessing scripts. These scripts reorganize directory structure, co-register structural and functional data, performs slice-time correction, motion correction, perform skull stripping, and create a brain mask. 
	</li> 
	<li><code>3dDeconvolve_batch.sh</code> and <code>3dDeconvolve_job.sh</code> – performs deconvolution of HRF with T<sub>2</sub>* data. Also blurs the output of the data.
	</li>
	<li><code>ants_batch.sh</code> and <code>ants_job.sh</code> – performs ANTs transformation of the functional results to a preconstructed structural template image.
	</li>
	<li><code>3dttest_batch.sh</code> and <code>3dttest_job.sh</code> – performs student's T-test on participant data, creating a single group statistical map.
	</li>
</ol>

## Dependencies

<ul>
	<li>R
	</li>
	<li>AFNI
	</li>
	<li>ANTs
	</li>
	<li><code>ANTifyfunctional</code>
	</li>
	<li><code>move_censor.pl</code>
	</li>
</ul>