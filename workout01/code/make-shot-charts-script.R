#title: make-shots-chart-script
#description: Doing data visualization by creation charts for five players' shots data respectively and together
#inputs: five players' shots data after data preparation(shots-data.csv)
#outputs: five pdf file for five players' shots chart and a pdf file and a image file for all the five players' shots chart together

dat <- read.csv("../output/shots-data.csv",stringsAsFactors = FALSE)
library(dplyr)
library(ggplot2)
curry<- filter(dat,name=="Stephen Curry")
iguodala<-filter(dat,name=="Andre Iguodala")
green<- filter(dat,name=="Draymond Green")
durant<- filter(dat,name=="Kevin Durant")
thompson<-filter(dat,name=="Klay Thompson")

library(jpeg)
library(grid)
count_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(count_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)
pdf(file = "../images/klay-thompson-shot-chart.pdf",width = 6.5,height = 5)
ggplot(data=thompson) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Klay Thompson (2016 season)')+
  theme_minimal()
dev.off()
pdf(file = "../images/andre-iguodala-shot-chart.pdf",width = 6.5,height = 5)
ggplot(data=iguodala) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Andre Iguodala (2016 season)')+
  theme_minimal()
dev.off()
pdf(file = "../images/draymond-green-shot-chart.pdf",width = 6.5,height = 5)
ggplot(data=green) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Draymond Green (2016 season)')+
  theme_minimal()
dev.off()
pdf(file = "../images/kevin-durant-shot-chart.pdf",width = 6.5,height = 5)
ggplot(data=durant) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Kevin Durant (2016 season)')+
  theme_minimal()
dev.off()
pdf(file = "../images/stephen-curry-shot-chart.pdf",width = 6.5,height = 5)
ggplot(data=curry) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+
  theme_minimal()
dev.off()

pdf(file = "../images/gsw-shot-charts.pdf",width = 8,height = 7)
ggplot(data=dat) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  facet_wrap(~ name)+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+
  theme_minimal()
dev.off()
png(file = "../images/gsw-shot-charts.png",width = 800,height = 700)
ggplot(data=dat) +
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color= shot_made_flag))+
  facet_wrap(~ name)+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 season)')+
  theme_minimal()
dev.off()
