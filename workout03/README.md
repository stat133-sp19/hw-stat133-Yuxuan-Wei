## Overview

The package `"binomial"` is a package that implements functions for calculating probabilities of a binomial random variable, and relate calculations.

  - `bin_choose()` This function calculates the number of combinations in which k successes can occur in n trials. 
  - `bin_probability()` This function calculates the probability of combinations in which k successes can occur in n trials.
  - `bin_distribution()` This function calculates the pribability distribution of all the possible successes of combinations can occur in n trials.
  - `bin_cumulative()` This function calculates the cumulative probability distribution of all the possible successes of combinations can occur in n trials,with plot method for class `bincum` to get a linegraph of the cumulative probability distribution.
  - `bin_variable()` This function output a binomial random variable object of class `binvar`,which contains a list of named elements(trials and prob),with print method for class `binvar` to print the content of the object. This function also has summary method for class `binvar` to get an object of class `summary.binvar`, which contains a list of calculations as named elements(trials,prob,mean,variance,mode,skewness,kurtosis), with print method for class `summary.binvar` to print the content of the object.
  - Summary function as `bin_mean()`,`bin_variance()`,`bin_mode()`,`bin_skewness()`,`bin_kurtosis()` return the value of mean,variance,mode,skewness and kurtosis for the binomial

## Motivation

This project has been developed to exercise and implement some of the concepts
and technique of R package which we learn from lecture. 

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-Yuxuan-Wei/workout03")

# install "binomial" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-Yuxuan-Wei/workout03", build_vignettes = TRUE)
```

## Usage

``` r
library(binomial)

# bin_choose
bin_choose(n=5L,k=2L)
#> [1] 10
bin_choose(5L,0L)
#> [1] 1
bin_choose(5L,1L:3L)
#> [1]  5 10 10

# bin_probability
bin_probability(success=2L,trials=5L,prob=0.5)
#> [1] 0.3125
bin_probability(success=0L:2L,trials=5L,prob=0.5)
#> [1] 0.03125 0.15625 0.31250
bin_probability(success=55L,trials=100L,prob=0.45)
#> [1] 0.01075277

# bin_distribution
bin_distribution(trials=5L,prob=0.5)
#> $dat
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125
#> 
#> attr(,"class")
#> [1] "bindis"
dis1<-bin_distribution(trials=5L,prob=0.5)
plot(dis1)

# bin_cumulative
bin_cumulative(trials=5L,prob=0.5)
#> $dat
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000
#> 
#> attr(,"class")
#> [1] "bincum"
dis2<-bin_cumulative(trials=5L,prob=0.5)
plot(dis2)

# bin_variable
bin1<-bin_variable(trials=10L,prob=0.3)
bin1
#> "Binomial variable"
#> 
#> Paramaters
#> - number of trials: 10 
#> - prob of success : 0.3
bin1<-bin_variable(trials=10L,prob=0.3)
binsum1<-summary(bin1)
binsum1
#> "Summary Binomial"
#> 
#> Paramaters
#> - number of trials: 10 
#> - prob of success : 0.3 
#> 
#> Measures
#> - mean    : 3 
#> - variance: 2.1 
#> - mode    : 3 
#> - skewness: 0.276026223736942 
#> - kurtosis: -0.123809523809524

# function of methods
bin_mean(trials=10L,prob=0.3)
#> [1] 3
bin_variance(trials=10L,prob=0.3)
#> [1] 2.1
bin_mode(trials=10L,prob=0.3)
#> [1] 3
bin_skewness(trials=10L,prob=0.3)
#> [1] 0.2760262
bin_kurtosis(trials=10L,prob=0.3)
#> [1] -0.1238095
```
