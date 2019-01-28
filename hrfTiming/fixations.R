#This script builds the HRF for fixations.

#Set the working environment.
setwd("~/Box/LukeLab/SkilledReadingStudy/workingDirectory/timingFiles/oculomotor")

#create the directory to hold hrf files.
if (file.exists("fixations")){
  setwd("fixations")
} else {
  dir.create("fixations")
  setwd("fixations")
}

#################
#FIXATION EVENTS#
#################

#Read in fixvsac.csv as table.
group <- read.csv("~/Box/LukeLab/SkilledReadingStudy/workingDirectory/timingFiles/source_csvs/fixvsac.csv")
colnames(group)

#remove NA values form group matrix
group = group[is.na(group$START_TIME_FIX) == FALSE, ]
group = group[is.na(group$FIX_DURATION) == FALSE, ]

#Convert times to milliseconds
group$START_TIME_FIX = group$START_TIME_FIX/1000
group$FIX_DURATION = group$FIX_DURATION/1000

#Add saccade amplitude as amplitude modulator
group$Parametric = paste((group$START_TIME_FIX), group$FIX_DURATION, sep = ":")

#Remove unneeded columns
mdata = group
colnames(mdata)
mdata <- mdata[c(1,4,9)]
library(reshape2)
mdata <- melt(mdata, id=c("RECORDING_SESSION_LABEL","RUN"))
mdata = mdata[is.na(mdata$RECORDING_SESSION_LABEL) == FALSE, ]

#Assemble the individual AM timing files so that each subject has an individual timing file with one row per run
for (i in unique(mdata$RECORDING_SESSION_LABEL)) {
  sub1data = mdata[mdata$RECORDING_SESSION_LABEL == i, ]
  colnames(sub1data)
  if (nrow(sub1data) > 0) {
    sub1data = sub1data[c(2:4)]
    sub1data$variable = 1:nrow(sub1data)
    sub1data[sub1data$RUN == 3, ]$variable = sub1data[sub1data$RUN == 3, ]$variable - max(sub1data[sub1data$RUN == 2, ]$variable)
    sub1data[sub1data$RUN == 2, ]$variable = sub1data[sub1data$RUN == 2, ]$variable - max(sub1data[sub1data$RUN == 1, ]$variable)
    sub1data = dcast(sub1data, RUN ~ variable)
    sub1data = sub1data[2:ncol(sub1data)]
    write.table(sub1data, paste(i,".txt", sep = ""), sep = "\t", na = "", col.names = FALSE, row.names = FALSE, quote = FALSE)
  }
}

summary(mdata$RECORDING_SESSION_LABEL)
