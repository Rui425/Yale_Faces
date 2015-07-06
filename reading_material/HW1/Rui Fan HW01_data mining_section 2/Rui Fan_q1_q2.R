############ 2.8 #############
##(a)
# read the data
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

## c.
meanandsd<-matrix(NA,8,2)
for(i in 1:8) {
  meanandsd[i,1]<-mean(Auto[,i])
  meanandsd[i,2]<-sd(Auto[,i])
}
meanandsd

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

## e. 
pairs(Auto)

## f. 
fit<-lm(mpg~cylinders+displacement+horsepower+weight+acceleration+year+origin)
summary(fit)

