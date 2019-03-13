#title: make-shots-data-script
#description: Doing data preparation which create a csv file shots-data.csv that contains the required variables(five players' shots data) to be used in the visualization phase
#inputs: five players' shots data(andre-iguodala.csv,draymond-green.csv,kevin-durant.csv,klat-thompson.csv,stephen-curry.csv)
#outputs: a csv file shots-data.csv that contains the required variables(five players' shots data) to be used in the visualization phase

curry <- read.csv("../data/stephen-curry.csv",stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv",stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv",stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv",stringsAsFactors = FALSE)
thompson<- read.csv("../data/klay-thompson.csv",stringsAsFactors = FALSE)

curry$name<- "Stephen Curry"
iguodala$name<- "Andre Iguodala"
green$name<- "Draymond Green"
durant$name<- "Kevin Durant"
thompson$name<- "Klay Thompson"

curry$shot_made_flag[which(curry$shot_made_flag=="n")]="shot_no"
curry$shot_made_flag[which(curry$shot_made_flag=="y")]="shot_yes"
iguodala$shot_made_flag[which(iguodala$shot_made_flag=="n")]="shot_no"
iguodala$shot_made_flag[which(iguodala$shot_made_flag=="y")]="shot_yes"
green$shot_made_flag[which(green$shot_made_flag=="n")]="shot_no"
green$shot_made_flag[which(green$shot_made_flag=="y")]="shot_yes"
durant$shot_made_flag[which(durant$shot_made_flag=="n")]="shot_no"
durant$shot_made_flag[which(durant$shot_made_flag=="y")]="shot_yes"
thompson$shot_made_flag[which(thompson$shot_made_flag=="n")]="shot_no"
thompson$shot_made_flag[which(thompson$shot_made_flag=="y")]="shot_yes"

curry$minutes<- curry$period*12-curry$minutes_remaining
iguodala$minutes<- iguodala$period*12-iguodala$minutes_remaining
green$minutes<- green$period*12-green$minutes_remaining
durant$minutes<- durant$period*12-durant$minutes_remaining
thompson$minutes<- thompson$period*12-thompson$minutes_remaining

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

shots_data <- curry
shots_data<- rbind(shots_data,iguodala,green,durant,thompson)

write.csv(
  x = shots_data,
  file = '../output/shots-data.csv'
)

sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()