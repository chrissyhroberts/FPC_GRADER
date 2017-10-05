############################################################
#Photo grading tool v 4.0 : SCRIPTS
############################################################

############################################################
# This script should be sourced before running fpcgrade()
############################################################
#check for output file and list of graded files

if(!file.exists("graded.txt")){write.table(x = "graded",file = "graded.txt",quote = F,row.names = F,col.names = F)}
if(!file.exists("results.txt")){write.table(x = 'ID\tF.SCORE\tP.SCORE\tC.SCORE\tNOTES',file = "results.txt",quote = F,row.names = F,col.names = F)}

############################################################
# define the function to allow images to be shown in Rstudio's viewer pane

showimageinviewerpane<-function(filetograde,pathtofiles)
{
  tempDir <- tempfile()
  dir.create(tempDir)
  bodytext<-paste('<!DOCTYPE html\n<html>\n<body>\n<h2>',filetograde,'</h2>\n<img src="',filetograde,'" alt="PHOTO" style="width:1028px;height:800px;">\n</body>\n</html>',sep="")
  cat(bodytext, file = file.path(tempDir, "index.html"))
  fullpath<-paste(pathtofiles,filetograde,sep="")
  file.copy(from = fullpath,to =tempDir)
  list.files(path = tempDir)
  bodytext
  htmlFile <- file.path(tempDir, "index.html")
  # (code to write some content to the file)
  viewer <- getOption("viewer")
  viewer(htmlFile)
  unlink(tempDir)

}

############################################################
# define function to do typing for one specimen

  grade<-function(photo,pathtofiles)
  {
    already_graded<-as.character((read.table("graded.txt",header=T))[,1])
    if(is.na(match(photo,already_graded)))
    {

  showimageinviewerpane(filetograde = photo,pathtofiles = pathtofiles)

  F.SCORE<-9
  P.SCORE<-9
  C.SCORE<-9
  NOTES<-9
  #get F score

  while(F.SCORE==9)
  {
    F.SCORE <- as.integer(readline("enter F score 0-3 : "))
    if(is.na(F.SCORE)){break}  # breaks when hit enter
    if(F.SCORE<0 | F.SCORE>3){F.SCORE<-9}

  }

  #get P score
  while(P.SCORE==9)
  {
    P.SCORE <- as.integer(readline("enter P score 0-3 : "))
    if(is.na(P.SCORE)){break}  # breaks when hit enter
    if(P.SCORE<0 | P.SCORE>3){P.SCORE<-9}
  }

  #get C score
  while(C.SCORE==9)
  {
    C.SCORE <- as.integer(readline("enter C score 0-3 : "))
    if(is.na(C.SCORE)){break}  # breaks when hit enter
    if(C.SCORE<0 | C.SCORE>3){C.SCORE<-9}
  }


  while(NOTES==9)
  {
    NOTES <- as.character(readline("enter NOTES : "))
    if(NOTES==""){NOTES<-"NONE"}  # breaks when hit enter
  }
results<-paste(c(photo,F.SCORE,P.SCORE,C.SCORE,NOTES),collapse = "\t")
write(x = photo,file = "graded.txt",append = T)
write(x =results,file = "results.txt",append = T)


}
    if(!is.na(match(photo,already_graded))){message ("Already graded")}

}


#################
#define function to test everything in input folder
fpcgrade<-function()
  {
  for(i in files.to.grade){grade(photo = i,pathtofiles = wherearefiles)}
  }






