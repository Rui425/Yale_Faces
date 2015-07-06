############ 2.8 #############
##(a)
college<-read.csv("http://www-bcf.usc.edu/~gareth/ISL/College.csv", header=TRUE)
##(b)
rownames(college)=college[,1]
fix(college)
college=college[,-1] 
fix(college)
##(c)
#i. 
summary(college)
#ii. 
pairs(college[,1:10])
#iii. 
attach(college)
plot(Outstate~Private)
#iv. 
Elite=rep("No",nrow(college))
Elite[college$Top10perc >50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college ,Elite)
summary(Elite)
   No Yes 
  699  78 
plot(college$Outstate~college$Elite)
# v.
names(college)
par(mfrow=c(2,2))
hist(Personal, main="histogram on personal, bin=10",breaks=10)
hist(Personal, main="histogram on personal, bin=15",breaks=25)
hist(Grad.Rate, main="histogram on Grad.Rate, bin=10",breaks=10)
hist(Grad.Rate, main="histogram on Grad.Rate, bin=20",breaks=20)
#vi. 
summary(college)
dim(college)

########### 2.9 ############
## a. 
Auto<-read.table(file.choose(), header=T,na.strings="?")
Auto=na.omit(Auto)
names(Auto)
summary(Auto)
attach(Auto)
class(mpg)
class(cylinders)
class(displacement)
class(horsepower)
class(weight)
class(acceleration)
class(year)
class(origin)
class(name)
## b.
allrange<-matrix(NA,8,2)
for(i in 1:8) {
  allrange[i,1]<-range(Auto[,i])[1]
  allrange[i,2]<-range(Auto[,i])[2]
}
allrange
      [,1]   [,2]
[1,]    9   46.6
[2,]    3    8.0
[3,]   68  455.0
[4,]   46  230.0
[5,] 1613 5140.0
[6,]    8   24.8
[7,]   70   82.0
[8,]    1    3.0
## c.
meanandsd<-matrix(NA,8,2)
for(i in 1:8) {
  meanandsd[i,1]<-mean(Auto[,i])
  meanandsd[i,2]<-sd(Auto[,i])
}
meanandsd
[,1]        [,2]
[1,]   23.445918   7.8050075
[2,]    5.471939   1.7057832
[3,]  194.411990 104.6440039
[4,]  104.469388  38.4911599
[5,] 2977.584184 849.4025600
[6,]   15.541327   2.7588641
[7,]   75.979592   3.6837365
[8,]    1.576531   0.8055182
## d.
Autoremoved<-Auto[-(10:85),]
Autoremoved
summarywork<-matrix(NA,8,4)
for(i in 1:8) {
  summarywork[i,1]<-mean(Autoremoved[,i])
  summarywork[i,2]<-sd(Autoremoved[,i])
  summarywork[i,3]<-range(Autoremoved[,i])[1]
  summarywork[i,4]<-range(Autoremoved[,i])[2]  
}
summarywork
            [,1]       [,2]   [,3]   [,4]
[1,]   24.404430   7.867283   11.0   46.6
[2,]    5.373418   1.654179    3.0    8.0
[3,]  187.240506  99.678367   68.0  455.0
[4,]  100.721519  35.708853   46.0  230.0
[5,] 2935.971519 811.300208 1649.0 4997.0
[6,]   15.726899   2.693721    8.5   24.8
[7,]   77.145570   3.106217   70.0   82.0
[8,]    1.601266   0.819910    1.0    3.0
## e. 
pairs(Auto)
## f. 
fit<-lm(mpg~cylinders+displacement+horsepower+weight+acceleration+year+origin)
summary(fit)
Call:
  lm(formula = mpg ~ cylinders + displacement + horsepower + weight + 
       acceleration + year + origin)

Residuals:
  Min      1Q  Median      3Q     Max 
-9.6524 -2.0723 -0.0504  1.8022 13.0248 

Coefficients:
                Estimate  Std.Error t value  Pr(>|t|)    
(Intercept)  -2.182e+01  4.266e+00  -5.115   4.94e-07 ***
cylinders    -2.413e-01  3.382e-01  -0.714   0.4760    
displacement  1.558e-02  7.265e-03   2.144   0.0326 *  
horsepower    1.129e-02  6.991e-03   1.615   0.1071    
weight       -6.837e-03  5.797e-04  -11.795  < 2e-16 ***
acceleration  1.520e-01  7.738e-02   1.964   0.0503 .  
year          7.745e-01  4.930e-02   15.709  < 2e-16 ***
origin        1.359e+00  2.685e-01   5.062   6.41e-07 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 3.326 on 389 degrees of freedom
Multiple R-squared:  0.8226,  Adjusted R-squared:  0.8194 
F-statistic: 257.7 on 7 and 389 DF,  p-value: < 2.2e-16

############# 3.###########
## a. 
library(pixmap)
face_01<-read.pnm(file="/Users/fanrui/Desktop/data mining/Data set CroppedYale/yaleB01/yaleB01_P00A-005E+10.pgm")
face_01
face_01@size
Pixmap image
Type          : pixmapGrey 
Size          : 192x168 
Resolution    : 1x1 
Bounding box  : 0 0 168 192 
plot(face_01)
title('hw01_01a: the first face')
filename = 'hw01_01a.png'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()
class(x)
[1] "numeric"
summary(face_01)
Length      Class       Mode 
1      pixmapGrey       S4 

## b. 
face_01_matrix = getChannels(face_01)
face_02 = read.pnm(file = "/Users/fanrui/Desktop/data mining/Data set CroppedYale/yaleB02/yaleB02_P00A-005E+10.pgm")
face_02_matrix = getChannels(face_02)
faces_matrix = cbind( face_01_matrix , face_02_matrix )
faces = pixmapGrey( faces_matrix )
plot(faces)
min(faces_matrix)
max(faces_matrix)

## c. 
my.dir.list.1 = dir(path="/Users/fanrui/Desktop/data mining/Data set CroppedYale/",all.files=FALSE)
my.dir.list.2 = dir(path="/Users/fanrui/Desktop/data mining/Data set CroppedYale/",all.files=FALSE,recursive=TRUE)
length(my.dir.list.1)
[1] 38
length(my.dir.list.2)
[1] 2547
some(my.dir.list.1)
some(my.dir.list.2)

##### d. 
pic_list = c( 05 , 11 , 31 )
view_list = c(  'P00A-005E+10' , 'P00A-005E-10' , 'P00A-010E+00')
pic_data = vector("list",length(pic_list)*length(view_list))
faces_matrix = vector()

for(i in 1:3){
  for(j in 1:3){
    filename = sprintf("/Users/fanrui/Desktop/data mining/Data set CroppedYale/%s/%s_%s.pgm",my.dir.list.1[pic_list[i]] , my.dir.list.1[pic_list[i]] , view_list[j])
    faces_matrix_9 = read.pnm(file = filename)
    pic_data[[(i-1)*3+j]] = getChannels(faces_matrix_9)
  }
}
row1=cbind(pic_data[[1]],pic_data[[2]],pic_data[[3]])
row2=cbind(pic_data[[4]],pic_data[[5]],pic_data[[6]])
row3=cbind(pic_data[[7]],pic_data[[8]],pic_data[[9]])
faces_matrix=rbind(row1,row2,row3)
faces = pixmapGrey(faces_matrix)
plot(faces)
pdf("faces.pdf")
# give it a nice title
title('hw01_01d: 3x3 grid of faces')
# save the result
filename ="/Users/fanrui/Desktop/data mining"
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()



for(i in 1:length(pic_list)){
  for(j in 1:length(view_list)){
    filename = sprintf("/Users/fanrui/Desktop/data mining/Data set CroppedYale/%s/%s_%s.pgm",my.dir.list.1[pic_list[i]] , my.dir.list.1[pic_list[i]] , view_list[j])
    faces_matrix_9 = read.pnm(file = filename)
    singleface_matrix = getChannels(faces_matrix_9)
    face_matrix_row[[i]] = cbind( face_matrix_row , singleface_matrix )
  }
} 
face_matrix = rbind( face_matrix_row[[1]],face_matrix_row[[2]] ,face_matrix_row[[3]])
faces = pixmapGrey(faces_matrix)
plot(faces)

setwd("/Users/fanrui/Desktop/data mining/")
