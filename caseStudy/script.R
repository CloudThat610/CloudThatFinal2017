dataset1 <- maml.mapInputPort(1)
d = dim(dataset1)
data.set <- data.frame(sum(dataset1[,d[2]]==dataset1[,1])/d[1])

maml.mapOutputPort("data.set")
