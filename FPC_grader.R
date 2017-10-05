#############################################################
#Photo grading tool v 4.0 : SCRIPTS
############################################################
# Introduction
#
# This set of scripts uses R studio's 'viewer' pane to show pictures. Each picture will be displayed
# Enter trachoma grading scores Using the keyboard.
# It will not work in native R
# Entering a carriage return or newline without first entering a value will leave an NA value.
# Use NOTES to record additional observations.
# You need to have the graded.txt file in the folder from which you run the script.
# results.txt will be created automatically
#
############################################################
# Usage
#
# Step One : Adjust the settings below and save
#
# Step Two : open RStudio and type
#
#            source("FPC_grader.R")  [enter]
#
# The script will run automatically
# You can press escape at any time. The script when run again will pick up where you left off
#
# Results are saved to results.txt
#
# To change the size of the images, adjust line 20 of the fpc_grader_scripts.R file.
# It is currently set to 1028 * 800
#
############################################################
# Settings
#
# Enter the name of the folder containing the image files, keep the trailing forward slash
      wherearefiles<-"./input/"
#
#by default the script searches for JPEG files. Add any other image file types here, separated by pipes "|"
      files.to.grade<-list.files(path = wherearefiles, pattern = ".jpg|.JPG|.JPEG|.jpeg")
#
#pull in the commands needed to run the analysis by sourcing the fpc_grader_scripts.R file
      source("fpc_grader_scripts.R")
#
############################################################
# Run the typing software
      fpcgrade()
