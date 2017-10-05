# FPC_GRADER
A tool for rapid grading of trachoma using the FPC system

## Introduction
Trachoma is characterised by clinical assessment of conjunctival disease signs. Some researchers collect photographic evidence of clinical disease at the conjunctiva, but grading photographs can become burdensome when there are many hundreds or thousands to process.

This tool is designed to simplify the task of grading trachoma photos.

### FPC Grading

The platform implements Dawson’s 1981 system (referred to as the FPC system), which involves assessment of follicles (F), papillae (P) and cicatricae (C) on the conjunctivae.

For more details see 

*Dawson CR, Jones BR, Tarizzo ML, World Health Organization. Guide to trachoma
control in programmes for the prevention of blindness. Geneva, Switzerland: World
Health Organization; 1981.*  

### Benefits  

It provides a system for viewing and recording photo grades without the need to remove the hands from the keyboard. There are no mouse clicks, no need to open photo files, no need to record the results in a file. You simply put the photos to be graded in a folder, run the script and off you go.  

The system also records which files have previously been graded and won't allow you to accidentally grade the same file twice. It also keeps track of where you got to, so if you turn it off for a while, when you start it up again, it picks up where you left off. 

Our experienced photograders have informally benchmarked this at around 10 photographs per minute in populations with a low trachoma prevalence.  

The end result is a tidy data file saved on your computer hard drive.  
### Example output file

```
ID	F.SCORE	P.SCORE	C.SCORE	NOTES
DSC_0010.JPG	0	0	1	mild scars outside zone
DSC_0011.JPG	0	0	3	distortion on plane. barn door
DSC_0013.JPG	0	0	0	NONE
DSC_0014.JPG	0	0	0	NONE
DSC_0016.JPG	0	0	0	nothing
DSC_0017.JPG	0	0	0	NONE

```

### Nuts and Bolts  
  
This set of scripts uses R studio's 'viewer' pane to show pictures, therefore it will not work in command line R or in other R front ends (why would you?)

Entering a carriage return or newline without first entering a value will leave an NA value.
Use NOTES to record additional observations.

## INSTALLATION

Install R and R studio
Download the files in this repo

## Run

###Step One  
Adjust the settings in the FPC_grader.R file (with text editor or Rstudio) and then save the file without changing the name.  
  
###Step Two  
Open RStudio and type

>source("FPC_grader.R")

The script will run automatically

You can press escape at any time to quit. 


## To change the size of the images, adjust line 20 of the fpc_grader_scripts.R file.
## It is currently set to 1028 * 800
