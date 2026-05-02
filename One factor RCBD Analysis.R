# Loading the required Data
setwd("C:/Users/user/OneDrive/Desktop/Analysis")
ashmin<-read.csv("Rice.csv",header=TRUE)
attach(ashmin)
ashmin
# Defining the factors
ashmin$rep=as.factor(rep)
ashmin$trt=as.factor(trt)
# Test assumptions of ANOVA using gvlma test(Global Validation for Linear Model Assumption)
require(gvlma)
fit=lm(yield~rep+trt)
gvmodelfit=gvlma(fit)
gvmodelfit
boxplot(yield)
attach(ashmin)
ashmin
# Run and Load ANOVA Table for the data
anova(lm(yield~rep+trt))
# Compare means using DUNCAN test if results are non significant
require(agricolae)
dmrtcomparison<-with(ashmin,duncan.test(yield,trt,20,0.01874))
dmrtcomparison
# Compare means using LSD test if results are non significant
require(agricolae)
LSDcomparison<-with(ashmin,LSD.test(yield,trt,20,0.01874))
LSDcomparison
