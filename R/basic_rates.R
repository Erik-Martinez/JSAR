#' Basic Rate
#'
#'This function is the internal use to calculate some rates.
#'
#' @param num A number or a vector
#' @param den A number or a vector
#' @param factor A number
#'
#' @return Numeric
#' @keywords internal

basic_rate <- function(num, den, factor){
  result <- (sum(num) * factor) / sum(den)
  return(result)
}

#' Frequency rate
#'
#'A frequency rate indicate the number of new cases of injury
#'occurring in relation to the amount of time during which workers in the reference group
#'were "exposed to the risk" of being involved in an occupational accident.
#'
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param acci Number of new cases of occupational injury during the reference period,
#'  or a vector to sum.
#' @param factor Multiplicative factor to adjust the rate (default is 10^6).
#'
#' @return Numeric value of the frequency rate
#' @export
#'
#' @examples
#' # Example with one observation
#' frequency_rate(hours = 800000, acci = 80)

frequency_rate <- function(hours, acci, factor = 10^6){
  result <- basic_rate(acci, hours, factor)
  if (interactive()) {
    cat(sprintf("Frequency Rate: %.2f accidents per %d work hours",
                result, factor))
  }

  return(invisible(result))
}

#' Severity Rate
#'
#' The severity rates measure the time lost due to injuries in relation to the total
#' amount of time worked.
#'
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param days Number of days lost as a result of new cases of occupational
#'  injury during the reference period, or a vector to sum. In case of permanent
#'  incapacity each country have a scale to know how many days have to add for
#'  this kind of workers.
#' @param factor Multiplicative factor to adjust the rate (default is 10^3).
#'
#' @return Numeric value of the severity rate
#' @export
#'
#' @examples
#' severity_rate(hours = 800000, days = 300)
severity_rate <- function(hours, days, factor = 10^3){
  result <- basic_rate(days, hours, factor)
  if (interactive()) {
    cat(sprintf("Severity Rate: %.2f number of work days lost due to ocupaional injuries per %d work hours",
                result, factor))
  }

  return(invisible(result))
}

#' Incidence rate
#'
#'A frequency rate indicate the number of new cases of injury
#'occurring in relation to the amount of workers in the reference group.
#'
#' @param workers Total number of workers in the reference group during the
#'  reference period, or a vector to sum.
#' @param acci Number of new cases of occupational injury during the reference period,
#'  or a vector to sum.
#' @param factor Multiplicative factor to adjust the rate (default is 10^3).
#'
#' @return Numeric value of the incidence rate
#' @export
#'
#' @examples
#' incidence_rate(workers = 800, acci = 80)
incidence_rate <- function(workers, acci, factor = 10^3){
  result <- basic_rate(acci, workers, factor)
  if (interactive()) {
    cat(sprintf("Frequency Rate: %.2f accidents per %d workers",
                result, factor))
  }

  return(invisible(result))
}


#' Days Lost Rate
#'
#' Days lost rate indicated the median of day lost per case of occupational injure.
#'
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param acci Number of new cases of occupational injury during the reference period,
#'  or a vector to sum.
#' @param days Number of days lost as a result of new cases of occupational
#'  injury during the reference period, or a vector to sum. In case of permanent
#'  incapacity each country have a scale to know how many days have to add for
#'  this kind of workers.
#'
#' @return Numeric value of the days lost rate
#' @export
#'
#' @examples
#' days_lost_rate(hours = 800000, acci = 80, days = 300)
days_lost_rate <- function(hours, acci, days) {
  fr <- basic_rate(acci, hours, 10^6)
  sr <- basic_rate(days, hours, 10^3)
  result <- (sr * 10^3) / fr
  if (interactive()) {
    cat(sprintf("Days Lost Rate: %.2f number of work days lost per each accident",
                result))
  }

  return(invisible(result))
}

#' Safety Rate
#'
#' @param workers Total number of workers in the reference group during the
#'  reference period, or a vector to sum.
#' @param acci Number of new cases of occupational injury during the reference period,
#'  or a vector to sum.
#' @param hours Number of hours worked by workers in the reference group during
#'  the reference period, or a vector to sum.
#' @param factor Multiplicative factor to adjust the rate (default is 10^5).
#'
#' @return Numeric value of the days lost rate
#' @export
#'
#' @examples
#' safety_rate(workers = 800, acci = 80, hours = 800000)
safety_rate <- function(workers, acci, hours, factor = 10^5) {
  num <- (sum(workers) / sum(acci))
  result <- basic_rate(num, sum(hours), factor)
  if (interactive()) {
    cat(sprintf("Safety Rate: %.2f workers expose to risk per each accident and %d work hours",
                result, factor))
  }

  return(invisible(result))
}
