#' Frequency rate
#'
#'A frequency rate indicate the number of new cases of injury
#'occurring in relation to the amount of time during which workers in the reference group
#'were "exposed to the risk" of being involved in an occupational accident.
#' @param hours - Number total of Hours or vector
#' @param acci - Number total of accidents or vector
#' @param factor -
#'
#' @return numeric
#' @export
#'
#' @examples
#' frquency_rate(hours = 800000, acci = 80, factor = 10^6)
frequency_rate <- function(hours, acci, factor = 10^6){
  result <- (sum(acci) * factor) / sum(hours)
  return(result)
}

