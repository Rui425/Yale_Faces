#############################
# < Your Name Here >
# STAT W4240 
# Homework <HW Number> , Problem <Problem Number>
# < Homework Due Date >
#
# The following code loads the eigenfaces data and
# performs a set of simple loading and plotting functions
#############################

#################
# Setup
#################

# make sure R is in the proper working directory
# note that this will be a different path for every machine
setwd("~/Documents/academic/teaching/STAT_W4240_2014_SPRG/hw/hw01")

# first include the relevant libraries
# note that a loading error might mean that you have to
# install the package into your R distribution.  From the
# command line, type install.packages("pixmap")
library(pixmap)

#################
# Problem 1a
#################

# paste or type in the given code here
face_01 = read.pnm(file = "CroppedYale/yaleB01/yaleB01_P00A-005E+10.pgm")

# now plot the data
plot(face_01)
# give it a nice title
title('hw01_01a: the first face')
# save the result
filename = 'hw01_01a.png'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()

# extract the class and size
face_01_class = attr(face_01,'class')
face_01_size = attr(face_01,'size')
# print the result in a nice format
sprintf('Face 01 is of class %s, which has size %d by %d' , face_01_class , face_01_size[1] , face_01_size[2] )

#################
# Problem 1b
#################

# make face_01 into a matrix with the given command
face_01_matrix = getChannels(face_01)

# load a second face
face_02 = read.pnm(file = "CroppedYale/yaleB02/yaleB02_P00A-005E+10.pgm")
face_02_matrix = getChannels(face_02)

# combine two faces into a single data matrix and make that a pixmap
faces_matrix = cbind( face_01_matrix , face_02_matrix )
faces = pixmapGrey( faces_matrix )

# plot to verify
plot(faces)

# find min and max values 
faces_min = min(faces_matrix)
faces_max = max(faces_matrix)

# from the above we see the values are between 0 and 1, 0 
# corresponding to black, 1 to white

#################
# Problem 1c
#################

# get directory structure
dir_list_1 = dir(path="CroppedYale/",all.files=FALSE)
dir_list_2 = dir(path="CroppedYale/",all.files=FALSE,recursive=TRUE)

# find lengths
len_dl1 = length(dir_list_1)
len_dl2 = length(dir_list_2)


#################
# Problem 1d
#################

# the list of pictures (note the absence of 14 means that 31 corresponds to yaleB32)
pic_list = c( 05 , 11 , 31 )
view_list = c(  'P00A-005E+10' , 'P00A-005E-10' , 'P00A-010E+00')

# preallocate an empty list
pic_data = vector("list",length(pic_list)*length(view_list))
# initialize an empty matrix of faces data
faces_matrix = vector()
# outer loop through the pictures 
for ( i in 1:length(pic_list) ){
	# initialize an empty row of faces data
	this_face_row = vector()
	# inner loop over views
	for ( j in 1:length(view_list) ){
		# compile the correct file name
		# note that dir_list_1[pic_list[2]] should be "yaleB17" if pic_list[2] is B17
		this_filename = sprintf("CroppedYale/%s/%s_%s.pgm", dir_list_1[pic_list[i]] , dir_list_1[pic_list[i]] , view_list[j])
		# you can print out each name to help debug the code
		# print(this_filename)
		# load the data
		this_face = read.pnm(file = this_filename)
		this_face_matrix = getChannels(this_face)
		# append the view to the row for this face
		this_face_row = cbind( this_face_row , this_face_matrix )
	}
	# append the latest row to the face_matrix
	faces_matrix = rbind( faces_matrix , this_face_row )	
}

# now faces_matrix has been built properly.  plot and save it.
faces = pixmapGrey(faces_matrix)
plot(faces)
# give it a nice title
title('hw01_01d: 3x3 grid of faces')
# save the result
filename = 'hw01_01d.png'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()

#################
# End of Script
#################


