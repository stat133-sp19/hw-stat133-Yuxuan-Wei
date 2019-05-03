## ----echo = FALSE, message = FALSE---------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(binomial)

## ------------------------------------------------------------------------
bin_choose(n=5L,k=2L)
bin_choose(5L,0L)
bin_choose(5L,1L:3L)

## ------------------------------------------------------------------------
bin_probability(success=2L,trials=5L,prob=0.5)
bin_probability(success=0L:2L,trials=5L,prob=0.5)
bin_probability(success=55L,trials=100L,prob=0.45)

## ------------------------------------------------------------------------
bin_distribution(trials=5L,prob=0.5)

## ------------------------------------------------------------------------
dis1<-bin_distribution(trials=5L,prob=0.5)
plot(dis1)

## ------------------------------------------------------------------------
bin_cumulative(trials=5L,prob=0.5)

## ------------------------------------------------------------------------
dis2<-bin_cumulative(trials=5L,prob=0.5)
plot(dis2)

## ------------------------------------------------------------------------
bin_variable(trials=10L,prob=0.3)

## ------------------------------------------------------------------------
bin1<-bin_variable(trials=10L,prob=0.3)
bin1

## ------------------------------------------------------------------------
bin1<-bin_variable(trials=10L,prob=0.3)
summary(bin1)

## ------------------------------------------------------------------------
bin1<-bin_variable(trials=10L,prob=0.3)
binsum1<-summary(bin1)
binsum1

## ------------------------------------------------------------------------
bin_mean(trials=10L,prob=0.3)
bin_variance(trials=10L,prob=0.3)
bin_mode(trials=10L,prob=0.3)
bin_skewness(trials=10L,prob=0.3)
bin_kurtosis(trials=10L,prob=0.3)

