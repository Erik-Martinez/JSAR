test_that("frecuency rates works with scalar values", {
  hours <- 72800
  acci <- 9
  factor <- 10^6

  expected_result <- (acci * factor) / hours
  result <- frequency_rate(hours = hours, acci = acci, factor = factor)

  expect_equal(result, expected_result)
})

test_that("frecuency rates works with vector inputs", {
  hours <- c(70000, 2800)
  acci <- c(5, 4)
  factor <- 10^6

  expected_result <- (sum(acci) * factor) / sum(hours)
  result <- frequency_rate(hours = hours, acci = acci, factor = factor)

  expect_equal(result, expected_result)
})

test_that("frecuency rates works with defaul factor", {
  hours <- 72800
  acci <- 9

  expected_result <- (sum(acci) * 10^6) / sum(hours)
  result <- frequency_rate(hours = hours, acci = acci)

  expect_equal(result, expected_result)
})

#---------

test_that("severity rates works with scalar values", {
  hours <- 800000
  days <- 300
  factor <- 10^3

  expected_result <- (days * factor) / hours
  result <- severity_rate(hours = hours, days = days, factor = factor)

  expect_equal(result, expected_result)
})

test_that("severity rates works with vector inputs", {
  hours <- c(700000, 100000)
  days <- c(150, 150)
  factor <- 10^3

  expected_result <- (sum(days) * factor) / sum(hours)
  result <- severity_rate(hours = hours, days = days, factor = factor)

  expect_equal(result, expected_result)
})

test_that("severity rates works with defaul factor", {
  hours <- 800000
  days <- 300

  expected_result <- (sum(days) * 10^3) / sum(hours)
  result <- severity_rate(hours = hours, days = days)

  expect_equal(result, expected_result)
})
