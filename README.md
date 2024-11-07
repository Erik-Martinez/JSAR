
# JSAR

<!-- badges: start -->
[![R-CMD-check](https://github.com/Erik-Martinez/JSAR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Erik-Martinez/JSAR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

JSAR (Job Safety Analysis in R) is a package whose goal is to create tools for 
occupational risk prevention. Thousand of accidents occur daily in workplaces 
around the world. Analyzing them is basic to prevent them for next times. 
These analyses are usually made in Excel or with online tools that different
governments provide for their citizens; however, I think that R could be the perfect
environment to do this kind of analysis.
In this first steps of development, the idea would include tools for the 
analysis of accidents like the rates created by the International Labour Organization (ILO)
and the method of boundary lines.

The idea is to continue including and developing tools to help improve the safety and healt of the workers, 
so future developments may go beyond accident analysis, such as sample analysis techniques for industrial hygiene 
or survey analysis techniques for psychosociology.

## Installation

You can install the development version of JSAR like so:

``` r
# install.packages("devtools")
library(devtools)
install_github("Erik-Martinez/JSAR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(JSAR)
## basic example code
frequency_rate(hours = 800000, acci = 80)
```

