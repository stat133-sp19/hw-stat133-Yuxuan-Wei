#' @title Binomial skewness
#' @description Calculates the skewness of binomial
#' @param trials number of trials
#' @param prob probability
#' @return the skewness of binomial
#' @export
#' @examples
#'  \dontrun{
#' bin_skewness(trials=10L,prob=0.3)
#'  }
bin_skewness<- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  re<-aux_skewness(trials,prob)
  return(re)
}

# private function check valid probability value
check_prob <- function(prob){
  if(prob<0 |prob>1)
  {
     stop("invalid prob value")
  }
  TRUE
}

# private function check valid probability value
check_trials <- function(trials){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(trials<0)
  {
    stop("invalid trials value")
  }
  TRUE
}

# private auxiliary function compute mean
aux_mean <- function(trials,prob){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(prob<0 |prob>1)
  {
    stop("invalid prob value")
  }
  if(length(trials)!=1)
  {
    stop("invalid trials value")
  }
  if(length(prob)!=1)
  {
    stop("invalid prob value")
  }
  return(trials*prob)
}

# private auxiliary function compute variance
aux_variance <- function(trials,prob){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(prob<0 |prob>1)
  {
    stop("invalid prob value")
  }
  if(length(trials)!=1)
  {
    stop("invalid trials value")
  }
  if(length(prob)!=1)
  {
    stop("invalid prob value")
  }
  return(trials*prob*(1-prob))
}

# private auxiliary function compute mode
aux_mode <- function(trials,prob){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(prob<0 |prob>1)
  {
    stop("invalid prob value")
  }
  if(length(trials)!=1)
  {
    stop("invalid trials value")
  }
  if(length(prob)!=1)
  {
    stop("invalid prob value")
  }
  return(as.integer(trials*prob +prob))
}

# private auxiliary function compute skewness
aux_skewness <- function(trials,prob){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(prob<0 |prob>1)
  {
    stop("invalid prob value")
  }
  if(length(trials)!=1)
  {
    stop("invalid trials value")
  }
  if(length(prob)!=1)
  {
    stop("invalid prob value")
  }
  t1<- 1-2*prob
  t2<-sqrt(trials*prob*(1-prob))
  return(t1/t2)
}

# private auxiliary function compute kurtosis
aux_kurtosis <- function(trials,prob){
  if(!is.integer(trials))
  {
    stop("invalid trials value")
  }
  if(prob<0 |prob>1)
  {
    stop("invalid prob value")
  }
  if(length(trials)!=1)
  {
    stop("invalid trials value")
  }
  if(length(prob)!=1)
  {
    stop("invalid prob value")
  }
  t1<- 1-6*prob*(1-prob)
  t2<-trials*prob*(1-prob)
  return(t1/t2)
}

