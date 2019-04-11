#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Investing Modalities"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     
     column(4, wellPanel(
       sliderInput("amount",
                   "Initial Amount",
                   min = 1,
                   max = 100000,
                   value = 1000,
                   pre = "$", sep = ",",step = 20000),
       sliderInput("annual",
                   "Annual Contribution",
                   min = 0,
                   max = 50000,
                   value = 2000,
                   pre = "$", sep = ",",step = 10000)
     )),
     column(4, wellPanel(
       sliderInput("r_rate",
                   "Return Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 5),
       sliderInput("g_rate",
                   "Growth Rate (in %)",
                   min = 0,
                   max = 20,
                   value = 2)
     )),
     column(4, wellPanel(
       sliderInput("years",
                   "Years",
                   min = 0,
                   max = 50,
                   value = 10),
       selectInput("facet", label = "Facet?", 
                   choices = list("NO" = "NO", "YES" = "YES"), 
                   selected = "NO")
     )),
      mainPanel(
        h4("Timelines"),
        plotOutput("linePlot"),
        h4("Balances"),
        verbatimTextOutput("balances")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   output$linePlot <- renderPlot({
     future_value <- function(amount,rate,years) {
       fv=amount*(1+rate)^years
       return(fv)
     }
     annuity<- function(contrib,rate,years) {
       fva=contrib*((1+rate)^years-1)/rate
       return(fva)
     }
     growing_annuity<- function(contrib,rate,growth,years) {
       fvga=contrib*((1+rate)^years-(1+growth)^years)/(rate-growth)
       return(fvga)
     }
     year <- NULL
     balance <-NULL
     modality <-NULL
     model2<- NA
     model3<- NA
     for (j in 0:input$years+1){
       balance[j]<-future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
       year[j]<- j-1
       modality[j]<-"no_contrib"
     }
     for (j in 0:input$years+1){
       model2[j]<-annuity(contrib = input$annual ,rate = input$r_rate/100,year=j-1)+future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
       balance[j+input$years+1]<-model2[j]
       modality[j+input$years+1]<-"fixed_contrib"
       year[j+input$years+1]<- j-1
     }
     y <- input$years*2 + 2
     for (j in 0:input$years+1){
       model3[j]<-growing_annuity(contrib = input$annual,rate = input$r_rate/100,growth=input$g_rate/100,years = j-1)+future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
       balance[j+y]<-model3[j]
       year[j+y]<- j-1
       modality[j+y]<-"growing_contrib"     
      }
     dat <- data.frame(year=year,value=balance,variable=factor(modality))
     gg<- ggplot(data = dat, aes(x = year, y = value)) +
       geom_line(aes(color = variable)) +
       #scale_y_continuous(breaks=seq(0,90000,30000))+
       geom_point(shape=20,aes(color = variable))+
       ggtitle("Three models of investing")+
       #facet_grid(~ type)+
       theme_bw()
     if(input$facet == "YES")
       return(gg+facet_grid(~ variable)+geom_area(aes(y= value,fill=variable)))
     return(gg)
   })
   
   output$balances <- renderPrint({
     future_value <- function(amount,rate,years) {
       fv=amount*(1+rate)^years
       return(fv)
     }
     annuity<- function(contrib,rate,years) {
       fva=contrib*((1+rate)^years-1)/rate
       return(fva)
     }
     growing_annuity<- function(contrib,rate,growth,years) {
       fvga=contrib*((1+rate)^years-(1+growth)^years)/(rate-growth)
       return(fvga)
     }
     model1<- NA
     model2<- NA
     model3<- NA
     for (j in 0:input$years+1){
       model1[j]<-future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
     }
     for (j in 0:input$years+1){
       model2[j]<-annuity(contrib = input$annual ,rate = input$r_rate/100,year=j-1)+future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
     }
     for (j in 0:input$years+1){
       model3[j]<-growing_annuity(contrib = input$annual,rate = input$r_rate/100,growth=input$g_rate/100,years = j-1)+future_value(amount = input$amount ,rate = input$r_rate/100 ,year=j-1)
     }
     modalities <- data.frame(year=0:input$years,no_contrib=model1,fixed_contrib=model2,growing_contrib=model3)
     return(modalities)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

