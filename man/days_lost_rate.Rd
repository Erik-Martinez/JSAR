% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basic_rates.R
\name{days_lost_rate}
\alias{days_lost_rate}
\title{Days Lost Rate}
\usage{
days_lost_rate(hours, acci, days)
}
\arguments{
\item{hours}{Number of hours worked by workers in the reference group during
the reference period, or a vector to sum.}

\item{acci}{Number of new cases of occupational injury during the reference period,
or a vector to sum.}

\item{days}{Number of days lost as a result of new cases of occupational
injury during the reference period, or a vector to sum. In case of permanent
incapacity each country have a scale to know how many days have to add for
this kind of workers.}
}
\value{
Numeric value of the days lost rate
}
\description{
Days lost rate indicated the median of day lost per case of occupational injure.
}
\examples{
days_lost_rate(hours = 800000, acci = 80, days = 300)
}
