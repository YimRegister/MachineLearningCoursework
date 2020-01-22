library(corplot)
#import USArrests data
states = row.names(USArrests)

pairs(USArrests)

names(USArrests)

apply(USArrests,2,mean)
apply(USArrests,2,var)
# in the future I think it's important to either not use a dataset that has rape and murder in it,
# or to spend at least a minute discussing the importance and gravity of using such a heavy dataset in class.
# it felt a little silly that we were whipping through a lab while the word RAPE was all over the screen
# it felt very detached from the problem and I was totally unprepared.


pr.out = prcomp(USArrests,scale=TRUE)

names(pr.out)
pr.out
pr.out$center
pr.out$scale

dim(pr.out$x)
biplot(pr.out)

pr.out$rotation = -pr.out$rotation
pr.out$x = -pr.out$x
biplot(pr.out)

#now it comes down to interpreting
pr.var = pr.out$sdev^2
pr.var

pve = pr.var/sum(pr.var)
pve

plot(pve, xlab="Principal Component", ylab="Proportional of Variance explained",ylim=c(0,1), type='b')


#the problem from class on decision trees
-0.7*log2(0.7) - .3*log2(.3)
#.88

-.66*log2(0.66) - .33*log2(.33) #= .92

-.75*log2(.75) - .25*log2(.25) #= .81

(.92 * .6) + (.81 *.4) #=.876

# 5/23/19
# create synthetic data with different groups

set.seed(2)
x = matrix(rnorm(50*2),ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
#View(x)
km.out=kmeans(x,2,nstart=20)
km.out
km.out$tot.withinss
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=2",xlab="",ylab="",pch=20,cex=2)
#128.606

#View(x)
km.out=kmeans(x,5,nstart=20)
km.out
km.out$tot.withinss
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=2",xlab="",ylab="",pch=20,cex=2)
#50.895

#View(x)
km.out=kmeans(x,17,nstart=20)
km.out
km.out$tot.withinss
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=2",xlab="",ylab="",pch=20,cex=2)
#9.33

#View(x)
km.out=kmeans(x,1,nstart=20)
km.out
km.out$tot.withinss
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=2",xlab="",ylab="",pch=20,cex=2)
#473.6179

set.seed(3)

km.out=kmeans(x,3,nstart=20)
km.out
km.out$tot.withinss
#97.98
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=3",xlab="",ylab="",pch=20,cex=2)

km.out=kmeans(x,3,nstart=1)
km.out
plot(x, col=(km.out$cluster+1), main="K Means Clustering Results With K=3",xlab="",ylab="",pch=20,cex=2)
km.out$tot.withinss
#98.16


#hierarchical

hc.complete = hclust(dist(x),method="complete")
hc.average = hclust(dist(x),method="average")
hc.single = hclust(dist(x),method="single")

par(mfrow=c(1,3))

plot(hc.complete, main="Complete Linkage")
plot(hc.average,main="Average Linkage")
plot(hc.single,main="Single Linkage")


cutree(hc.complete,2)
km.out=kmeans(x,2,nstart=20)
km.out$cluster

xsc = scale(x)
plot(hclust(dist(xsc),method="complete"),main="Hierarchical Clustering with Scaled Features")

