#' Limits (Experimental)
#'
#' This function is internal to calculate the superior and inferior limits for
#' the frequency rate.
#'
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param fr Frequency rate expected
#' @param conf.level Confidence level of the interval.
#'
#' @details This function is experimental. Use it with caution. Its behavior
#'  may change in future releases.
#'
#' @return A list containing the following components:
#' \item{lim_inf}{The inferior limit.}
#' \item{lim_sup}{The superior limit.}
#' @export
#'
#' @examples
#' limits(1000000, 70)
limits <- function(hours, fr, conf.level = 0.9) {
  # Check Errors
  if (!is.numeric(hours) || hours <= 0) {
    stop("'hours' must be a positive number greater than 0.", call. = F)
  }
  if (!is.numeric(fr) || fr <= 0) {
    stop("'fr' must be a positive number greater than 0.", call. = F)
  }
  if (!is.numeric(conf.level) || conf.level <= 0 || conf.level >= 1) {
    stop("'conf.level' must be a number between 0 and 1 (exclusive).", call. = F)
  }

  if (hours < 10000) {
    stop("this method is not applicable with less of 10000 hours. To be use it, hours from consecutive months must be accumulated.",
      call. = F
    )
  }

  if (hours >= 10000 & hours <= 1200000) {
    warning("The limits are calculated assuming a normal distribution, not a Poisson distribution. The smaller the value of 'hours', the less reliable these limits become.",
      call. = F
    )
  }

  warning("This function is experimental and may change in future versions.",
    call. = F
  )

  # Function

  m <- fr * 10^-6 * hours
  s <- m^(1 / 2)
  f <- (10^6 / hours)
  lim_inf <- (m - (qnorm(1 - (1 - conf.level) / 2)) * s) * f
  lim_sup <- (m + (qnorm(1 - (1 - conf.level) / 2)) * s) * f

  return(list(lim_inf = lim_inf, lim_sup = lim_sup))
}
