#############################
# < Rui Fan >
# STAT W4240 
# Homework <HW #1> , Problem <Problem Number>
# < Homework Due Date 1/29/2015 >
#
# The following code loads the eigenfaces data and
# performs a set of simple loading and plotting functions
#############################

#################
# Setup
#################

# make sure R is in the proper working directory
# note that this will be a different path for every machine
setwd("/Users/fanrui/Desktop/data mining")

# first include the relevant libraries
# note that a loading error might mean that you have to
# install the package into your R distribution.  From the
# command line, type install.packages("pixmap")
library(pixmap)

#################
# Problem 1a
#################

# paste or type in the given code here
face_01 = read.pnm(file = "/Users/fanrui/Desktop/data mining/Data set CroppedYale/yaleB01/yaleB01_P00A-005E+10.pgm")

# now plot the data
plot(face_01)
# give it a nice title
title('hw01_01a: the first face')
# save the result
filename = 'hw01_01a.png'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()
~/Desktop/data mining/HW1/hw01_01a.png.jpeg

# extract the class and size

#----- START YOUR CODE BLOCK HERE -----#
# Find the size and other information of the document
face_01
# classificate the variable
class(x)
#----- END YOUR CODE BLOCK HERE -----#
## x is numerica and the size of the original image in pixels is 192*168. 

#################
# Problem 1b
#################

# make face_01 into a matrix with the given command
face_01_matrix = getChannels(face_01)

# load a second face
face_02 = read.pnm(file = "/Users/fanrui/Desktop/data mining/Data set CroppedYale/yaleB02/yaleB02_P00A-005E+10.pgm")
face_02_matrix = getChannels(face_02)

# combine two faces into a single data matrix and make that a pixmap
faces_matrix = cbind( face_01_matrix , face_02_matrix )
faces = pixmapGrey( faces_matrix )

# plot to verify
plot(faces)
~/Desktop/data mining/HW1/matrix_faces.jpeg

# find min and max values 

#----- START YOUR CODE BLOCK HERE -----#
min(faces_matrix)
max(faces_matrix)

#----- END YOUR CODE BLOCK HERE -----#

#################
# Problem 1c
#################

# get directory structure
dir_list_1 = dir(path="/Users/fanrui/Desktop/data mining/Data set CroppedYale/",all.files=FALSE)dir_list_2 = dir(path="/Users/fanrui/Desktop/data mining/Data set CroppedYale/",all.files=FALSE,recursive=TRUE)

# find lengths

#----- START YOUR CODE BLOCK HERE -----#
length(my.dir.list.1)
length(my.dir.list.2)
# find some of the vatiables in these list
some(my.dir.list.1)
some(my.dir.list.2)
 
#----- END YOUR CODE BLOCK HERE -----#


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

#----- START YOUR CODE BLOCK HERE -----#
for(i in 1:length(pic_list)) {
  for(j in 1:length(view_list)) {
    # start the loop and define the path of these 9 specific pictures
    filename = sprintf("/Users/fanrui/Desktop/data mining/Data set CroppedYale/%s/%s_%s.pgm",my.dir.list.1[pic_list[i]] , my.dir.list.1[pic_list[i]] , view_list[j])
    # read the pnm pictures 
    faces_matrix_9 = read.pnm(file = filename)
    # find the matrix of each specific picture
    singleface_matrix = getChannels(faces_matrix_9)
    # when i=i, bind the j=1 to 3 picture matrixs to a row
    face_matrix_row[[i]] = cbind( face_matrix_row , singleface_matrix )
  }
} 
# bind the three row matrixs together into a whole matrix
face_matrix = rbind( face_matrix_row[[1]],face_matrix_row[[2]] ,face_matrix_row[[3]])
faces = pixmapGrey(faces_matrix)
# visulized the face matrix
plot(faces)
# save as pdf
pdf("faces.pdf")

#----- END YOUR CODE BLOCK HERE -----#

# now faces_matrix has been built properly.  plot and save it.
faces = pixmapGrey(faces_matrix)
plot(faces)
# give it a nice title
title('hw01_01d: 3x3 grid of faces')
# save the result
filename = 'hw01_01d.png'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()
~/Desktop/data mining/hw01_01d: 3x3 grid of faces.pdf
#################
# End of Script
#################


