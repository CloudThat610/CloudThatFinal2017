setwd('./vmware/Lab2IPLTossPrediction')
wd <- getwd()
wd
setwd('Lab2IPLTossPrediction')
library(e1071)
iplmatches <- read.csv("matches.csv",header=TRUE,stringsAsFactors=FALSE)
iplmatches <- iplmatches[,c("toss_winner","venue","toss_decision")]

train <- data.frame(class=c(iplmatches$toss_decision),tw=c(iplmatches$toss_winner),venue=c(iplmatches$venue))

levels(train$venue)# lists in console

classifier <- naiveBayes(class ~ venue,train) #train the model
test <- data.frame(venue=c("Wankhede Stadium"))
test$venue <- factor(test$venue,levels=c("Barabati Stadium","Brabourne Stadium","Buffalo Park","De Beers Diamond Oval","Dr DY Patil Sports Academy",
                                         "Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium","Dubai International Cricket Stadium",
                                         "Eden Gardens","Feroz Shah Kotla", "Green Park","Himachal Pradesh Cricket Association Stadium",
                                         "Holkar Cricket Stadium","JSCA International Stadium Complex","Kingsmead","M Chinnaswamy Stadium",
                                         "MA Chidambaram Stadium, Chepauk","Maharashtra Cricket Association Stadium", "Nehru Stadium",
                                         "New Wanderers Stadium","Newlands","OUTsurance Oval","Punjab Cricket Association IS Bindra Stadium, Mohali",
                                         "Rajiv Gandhi International Stadium, Uppal","Sardar Patel Stadium, Motera","Saurashtra Cricket Association Stadium",
                                         "Sawai Mansingh Stadium","Shaheed Veer Narayan Singh International Stadium","Sharjah Cricket Stadium",
                                         "Sheikh Zayed Stadium","St George's Park","Subrata Roy Sahara Stadium","SuperSport Park","Vidarbha Cricket Association Stadium, Jamtha",
                                         "Wankhede Stadium"))
prediction <- predict(classifier, test ,type="raw")
prediction
