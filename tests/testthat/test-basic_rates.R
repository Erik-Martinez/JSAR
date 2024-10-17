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
