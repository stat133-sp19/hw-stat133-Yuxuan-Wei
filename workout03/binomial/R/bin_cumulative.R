#' @title Binomial cumulative
#' @description Calculates the probability distribution and cumulative probabilities
#' @param trials number of trials
#' @param prob number of success
#' @return the probability distribution and cumulative probabilities
#' @export
#' @examples
#'  \dontrun{
#' bin_cumulative(trials=5L,prob=0.5)
#'  }
bin_cumulative<- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  pro<-NA
  cum<-NA
  x=0
  for (i in 0:trials) {
    t1<-factorial(trials)
    t2<-factorial(i)*factorial(trials-i)
    t3<-t1/t2
    t4<- t3*prob^i*(1-prob)^(trials-i)
    pro[i+1]<-t4
    x=x+t4
    cum[i+1]<-x
  }
  object <- list(dat=data.frame(success = 0:trials,probability = pro,cumulative = cum))
  class(object) <- "bincum"
  object
}

#' @export
plot.bincum<-function(x,...){
  plot(x$dat$success,x$dat$cumulative,xlab ="successes",ylab ="probability",type="o",
       main="Cumulative probability graph")
}
