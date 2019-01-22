# readingOculomotor

This repository contains the code used to examine the hemodynamic response associated with oculomotor control in skilled reading in the BYU Reading Study. Scripts were written for the supercomputer environment. Scripts with the suffix <code>_batch.sh</code> reference scripts with the suffix <code>_job.sh</code> and executes them once per participant. Job scripts contain the commands to be executed on the data.

## Outline of scripts and order of execution

<ol>
	<li><code>preproc_batch.sh</code> and <code>preproc_job.sh</code>--preprocessing scripts. These scripts reorganize directory structure, co-register structural and functional data, performs slice-time correction, motion correction, perform skull stripping, and create a brain mask. 
	</li> 
	<li><code>3dDeconvolve_batch.sh</code> and <code>3dDeconvolve_job.sh</code>--performs deconvolution of HRF with T<sub>2</sub>* data. Also blurs the output of the data.
	</li>
	<li><code>ants_batch.sh</code> and <code>ants_job.sh</code>--performs ANTs transformation of the functional results to a preconstructed structural template image.
	</li>
	<li><code>3dttest_batch.sh</code> and <code>3dttest_job.sh</code>--performs student's T-test on participant data, creating a single group statistical map.
	</li>
</ol>