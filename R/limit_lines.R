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
  m <- fr * 10^-6 * hours
  s <- m^(1/2)
  f <- (10^6 / hours)
  lim_inf <- (m - (qnorm(1 - (1 - conf.level)/2)) * s) * f
  lim_sup <- (m + (qnorm(1 - (1 - conf.level)/2)) * s) * f

  return(list(lim_inf = lim_inf, lim_sup = lim_sup))
}
# El problema con todo este proceso es que no te has dado cuenta que la empresa
# tiene que dar previamente un valor esperado de frecuency_rate y tambien tienes
#que pensar en el tema de la ley de poisson que se calcula fe forma distnita
# el ntp no parece indicar como pero el libro finito si
# A partir de 610000 las formula funciona bien pero no para numeros más pequeños
# tengo que buscar una solución para los datos mas pequños
