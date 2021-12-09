setwd("/Users/mayuheng/Documents/GitHub/UNHackson")
data=read.csv("./cleaned_data/new.csv")
regressiondata=read.csv("./cleaned_data/regression_data.csv")[2:6]
data[[6]]=data[[6]]/100

#model=lm(access.to.education~.,data=data[-9,])
#summary(model)
#sample=cbind(rep(1,19),as.matrix(regressiondata))
result=NULL
#for (i in 1:19){
#result=c(result,model$coefficients%*% sample[i,])
#}
data=data[-9,]
model=glm(access.to.education~.,family=binomial(link='logit'),data=data)
summary(model)
pre=predict(model,newdata=regressiondata[,1:5],type = 'response')

#result=NULL
for( i in 1:11){
#model=lm(access.to.education~.,data=data[-i,])
model=glm(access.to.education~.,family=binomial(link='logit'),data=data[-i,])
#summary(model)
print(summary(model))
result=c(result,predict(model,newdata=data[i,1:5],type = 'response'))

}

#glm(Survived ~.,family=binomial(link='logit'),data=data[-9,])
#predict(model,newdata=
