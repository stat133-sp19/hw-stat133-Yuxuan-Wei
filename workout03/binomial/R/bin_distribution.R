#' @title Binomial distribution
#' @description Calculates the probability distribution
#' @param trials number of trials
#' @param prob number of success
#' @return the probability distribution
#' @export
#' @examples
#'  \dontrun{
#' bin_distribution(trials=5L,prob=0.5)
#'  }
bin_distribution<- function(trials,prob) {
  check_prob(prob)
  check_trials(trials)
  pro<-NA
  for (i in 0:trials) {
    t1<-factorial(trials)
    t2<-factorial(i)*factorial(trials-i)
    t3<-t1/t2
    t4<- t3*prob^i*(1-prob)^(trials-i)
    pro[i+1]<-t4
  }
  object <- list(dat=data.frame(success = 0:trials,probability = pro))
  class(object) <- "bindis"
  object
}

#' @export
plot.bindis<-function(x,...){
  barplot(x$dat$probability,names.arg=x$dat$success,xlab ="successes",ylab ="probability",
          main="Probability histgrom")
}
