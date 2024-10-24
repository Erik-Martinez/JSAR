#' Limits
#'
#' This function is internal to calculate the superior and inferior limits for
#' the frequency rate.
#'
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param fr Frequency rate expected
#' @param conf.level Confidence level of the interval.
#'
#' @return A list containing the following components:
#' \item{lim_inf}{The inferior limit.}
#' \item{lim_sup}{The superior limit.}
#' @keywords internal
limits <- function(hours, fr, conf.level = 0.9) {

  if (hours < 10000){
    stop("this method is not applicable with less of 10000 hours. To be use it,
         hours from consecutive months must be accumulated.")
  }
  else if (hours >= 10000 & hours <= 1200000){
    warning("The limits are calculated assuming a normal distribution, not a Poisson distribution. The smaller the value of 'hours', the less reliable these limits become.", call.=F)
  }
  m <- fr * 10^-6 * hours
  s <- m^(1/2)
  f <- (10^6 / hours)
  lim_inf <- (m - (qnorm(1 - (1 - conf.level)/2)) * s) * f
  lim_sup <- (m + (qnorm(1 - (1 - conf.level)/2)) * s) * f

  return(list(lim_inf = lim_inf, lim_sup = lim_sup))
}

