#' @title Binomial choose
#' @description Calculates the number of combinations
#' @param n number of trials
#' @param k number of success
#' @return the number of combinations
#' @export
#' @examples
#'  \dontrun{
#' bin_choose(n=5L,k=2L)
#' bin_choose(5L,0L)
#' bin_choose(5L,1L:3L)
#'  }
bin_choose<- function(n,k) {
  check_trials(n)
  check_success(k,n)
  if(any(n<k))
  {
    stop("k cannot be greater than n")
  }
  t1<-factorial(n)
  t2<-factorial(k)*factorial(n-k)
  return(t1/t2)
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
