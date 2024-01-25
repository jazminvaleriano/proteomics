#!/usr/bin/env bash

# Run msconvert on an mzML file, claming a total of 1x4=4 GB RAM
# The job will need at most 10 min.

#----------------
# NOTE: REPLACE
#  name@students.unibe.ch with -your- email address
#  ibuUname (EVERYWHERE) with -your- IBU username
#  softLinkToFile: replace with the name of your soft link to your mzML file
#-----------------

# Set up

#SBATCH --partition=coursepm

#SBATCH --job-name=msconvert
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=1

# ADJUST the paths here:
#### error messages and standard output: 
#SBATCH --output=/home/mfaye/proteomics/output_%j.o
#SBATCH --error=/home/mfaye/proteomics/error_%j.e


# set some environment variables:
export LC_ALL=C;
unset LANGUAGE;

# Program path:
MSCONVERT=/data/courses/proteomics/Programs/msconvertLinux/msconvert

# Paths and file names to ADJUST:
MYHOME=/home/mfaye/proteomics
softLinkToFile=$MYHOME/green_MF_UniFR.mzML

# Example of actual command:
# Here it is assumed that the config file config.txt is in your home directory
# and that the output directory is also your home directory

$MSCONVERT $softLinkToFile -o $MYHOME/data -c $MYHOME/scripts/config.txt
