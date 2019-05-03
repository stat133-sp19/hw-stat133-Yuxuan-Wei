#' @title Binomial variable
#' @description Calculates the binomial variable
#' @param trials number of trials
#' @param prob probability
#' @return the binomial variable
#' @export
#' @examples
#'  \dontrun{
#' bin_variable(trials=10,prob=0.3)
#'  }
bin_variable<- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  object <- list(trials = trials,prob = prob)
  class(object) <- "binvar"
  object
}

#' @export
print.binvar<-function(x,...){
  cat('"Binomial variable"\n\n')
  cat('Paramaters\n')
  cat(sprintf('- number of trials: %s',x$trials),"\n")
  cat(sprintf('- prob of success : %s',x$prob),"\n")
}

#' @export
summary.binvar<-function(x,...){
  object <- list(trials = x$trials,prob = x$prob,mean=aux_mean(x$trials,x$prob),
                 variance=aux_variance(x$trials,x$prob),mode=aux_mode(x$trials,x$prob),
                 skewness=aux_skewness(x$trials,x$prob),kurtosis=aux_kurtosis(x$trials,x$prob))
  class(object) <- "summary.binvar"
  object
}

#' @export
print.summary.binvar<-function(x,...){
  cat('"Summary Binomial"\n\n')
  cat('Paramaters\n')
  cat(sprintf('- number of trials: %s',x$trials),"\n")
  cat(sprintf('- prob of success : %s',x$prob),"\n\n")
  cat('Measures\n')
  cat(sprintf('- mean    : %s',x$mean),"\n")
  cat(sprintf('- variance: %s',x$ variance),"\n")
  cat(sprintf('- mode    : %s',x$mode),"\n")
  cat(sprintf('- skewness: %s',x$skewness),"\n")
  cat(sprintf('- kurtosis: %s',x$kurtosis),"\n")
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
