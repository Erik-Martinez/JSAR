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
#' @param hours Number total of Hours or vector
#' @param acci Number total of accidents or vector
#' @param factor Multipliavate factor
#'
#' @return numeric
#' @export
#'
#' @examples
#' frequency_rate(hours = 800000, acci = 80, factor = 10^6)
frequency_rate <- function(hours, acci, factor = 10^6){
  result <- basic_rate(acci, hours, factor)
  if (interactive()) {
    cat(sprintf("Frequency Rate: %.2f per %d work hours in the reference group",
                result, factor))
  }

  return(invisible(result))
}

