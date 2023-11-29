#DeLong test
library(pROC)
y<-c()
for(i in 1:300){
  y<-c(y,0,1)
}
df<-read.delim('C:/Users/oonar/Downloads/unet_binClass_predictions.txt',
               header=FALSE)
dim(df)
x<-df[,1]
df<-read.delim('C:/Users/oonar/Downloads/inception_binClass_predictions.txt',
               header=FALSE)
z<-df[,1]
roc1=roc(y,x)
plot(roc1,col='blue',cex.lab=1.5,cex.axis=1.5)
roc2=roc(y,z)
par(new=TRUE)
plot(roc2,col='gray',axes=FALSE,xlab='',ylab='')
roc.test(roc1,roc2,method='delong')
#sign test
binom.test(c(sum(x==y),sum(z==y)),p=0.5)