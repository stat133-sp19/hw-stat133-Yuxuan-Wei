#' @title Binomial probability
#' @description Calculates the probability of number of combinations
#' @param trials number of trials
#' @param success number of success
#' @param prob probability
#' @return the probability of number of combinations
#' @export
#' @examples
#'  \dontrun{
#' bin_probability(success=2L,trials=5L,prob=0.5)
#' bin_probability(success=0L:2L,trials=5L,prob=0.5)
#' bin_probability(success=55L,trials=100L,prob=0.45)
#'  }
bin_probability<- function(success,trials,prob) {
  check_trials(trials)
  check_success(success,trials)
  check_prob(prob)
  if(any(success>trials))
  {
    stop("success cannot be greater than trials")
  }
  t1<-factorial(trials)
  t2<-factorial(success)*factorial(trials-success)
  t3<-t1/t2
  t4<- t3*prob^success*(1-prob)^(trials-success)
  return(t4)
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

# private function check valid probability value
check_success <- function(success,trials){
  if(!is.integer(success))
  {
    stop("invalid success value")
  }
  if(any(success>trials) | any(success<0) )
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
