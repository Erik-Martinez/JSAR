#' Title
#'
#' @param hours
#' @param acci
#' @param factor
#'
#' @return
#' @export
#'
#' @examples
frequency_rate <- function(hours, acci, factor = 10^6){
  result <- (sum(acci)*factor)/hours
  return(result)
}

