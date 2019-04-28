context("Check check_prob")
test_that("check_prob with prob between 0 and 1", {
  expect_true(check_prob(0.3))
  expect_error(check_prob(2))
})
test_that("check_prob with prob of length 1", {
  expect_error(check_prob(0.4,1))
})
test_that("check_prob with invalid prob return error", {
  expect_error(check_prob("a"))
})

context("Check check_trials")
test_that("check_trials with trials as integer", {
  expect_true(check_trials(2L))
  expect_error(check_trials(2))
})
test_that("check_trials with trials of length 1", {
  expect_error(check_trials(2L,1L))
})
test_that("check_trials with invalid trials return error", {
  expect_error(check_trials("a"))
})

context("Check check_success")
test_that("check_success with success as integer", {
  expect_true(check_success(2L,3L))
  expect_error(check_success(2,3L))
})
test_that("check_success with invalid success return error", {
  expect_error(check_success("a",3L))
})
test_that("check_success with success>trials return error", {
  expect_error(check_success(5L,4L))
})

context("Check aux_mean")
test_that("aux_mean with trials as integer", {
  expect_error(aux_mean(2,0.2))
})
test_that("aux_mean with trials of length 1", {
  expect_error(aux_mean(c(3L,2L),0.3))
})
test_that("aux_mean with prob between 0 and 1", {
  expect_error(aux_mean(2L,-0.2))
})
test_that("aux_mean with invalid input return error", {
  expect_error(aux_mean("a",0.3))
  expect_error(aux_mean(3L,"0.4"))
})

context("Check aux_variance")
test_that("aux_variance with trials as integer", {
  expect_error(aux_variance(2,0.2))
})
test_that("aux_variance with trials of length 1", {
  expect_error(aux_variance(c(3L,2L),0.3))
})
test_that("aux_variance with prob between 0 and 1", {
  expect_error(aux_variance(2L,-0.2))
})
test_that("aux_variance with invalid input return error", {
  expect_error(aux_variance("a",0.3))
  expect_error(aux_variance(3L,"0.4"))
})

context("Check aux_mode")
test_that("aux_mode with trials as integer", {
  expect_error(aux_mode(2,0.2))
})
test_that("aux_mode with trials of length 1", {
  expect_error(aux_mode(c(3L,2L),0.3))
})
test_that("aux_mode with prob between 0 and 1", {
  expect_error(aux_mode(2L,-0.2))
})
test_that("aux_mode with invalid input return error", {
  expect_error(aux_mode("a",0.3))
  expect_error(aux_mode(3L,"0.4"))
})

context("Check aux_skewness")
test_that("aux_skewness with trials as integer", {
  expect_error(aux_skewness(2,0.2))
})
test_that("aux_skewness with trials of length 1", {
  expect_error(aux_skewness(c(3L,2L),0.3))
})
test_that("aux_skewness with prob between 0 and 1", {
  expect_error(aux_skewness(2L,-0.2))
})
test_that("aux_skewness with invalid input return error", {
  expect_error(aux_skewness("a",0.3))
  expect_error(aux_skewness(3L,"0.4"))
})

context("Check aux_kurtosis")
test_that("aux_kurtosis with trials as integer", {
  expect_error(aux_kurtosis(2,0.2))
})
test_that("aux_kurtosis with trials of length 1", {
  expect_error(aux_kurtosis(c(3L,2L),0.3))
})
test_that("aux_kurtosis with prob between 0 and 1", {
  expect_error(aux_kurtosis(2L,-0.2))
})
test_that("aux_kurtosis with invalid input return error", {
  expect_error(aux_kurtosis("a",0.3))
  expect_error(aux_kurtosis(3L,"0.4"))
})

context("Check bin_choose")
test_that("bin_choose with sucesses as integer", {
  expect_error(bin_choose(2,3L))
})
test_that("bin_choose with trials as integer", {
  expect_error(bin_choose(2L,3))
})
test_that("bin_choose with sucesses > trials rerurn error", {
  expect_error(bin_choose(2L,3L))
})
test_that("bin_choose with invalid rerurn error", {
  expect_error(bin_choose(4L,"3L"))
  expect_error(bin_choose("2",3L))
})

context("Check bin_probability")
test_that("bin_probability with success as integer", {
  expect_error(bin_probability(2,3L,0.5))
})
test_that("bin_probabilitye with trials as integer", {
  expect_error(bin_probability(2L,3,0.5))
})
test_that("bin_probability with sucesses > trials rerurn error", {
  expect_error(bin_probability(3L,2L,0.5))
})
test_that("bin_probability with invalid rerurn error", {
  expect_error(bin_probability(4L,"3L",0.5))
  expect_error(bin_probability("2",3L,0.5))
  expect_error(bin_probability(2L,3L,"0.5"))
})
test_that("bin_probability with prob between 0 and 1", {
  expect_error(bin_probability(2L,3L,-0.5))
})

context("Check bin_distribution")
test_that("bin_distribution with trials as integer", {
  expect_error(bin_distribution(3,0.5))
})
test_that("bin_distribution with invalid rerurn error", {
  expect_error(bin_distribution("3L",0.5))
  expect_error(bin_distribution(3L,"0.5"))
})
test_that("bin_distribution with prob between 0 and 1", {
  expect_error(bin_distribution(3L,-0.5))
})

context("Check bin_cumulative")
test_that("bin_cumulative with trials as integer", {
  expect_error(bin_cumulative(3,0.5))
})
test_that("bin_cumulative with invalid rerurn error", {
  expect_error(bin_cumulative("3L",0.5))
  expect_error(bin_cumulative(3L,"0.5"))
})
test_that("bin_cumulative with prob between 0 and 1", {
  expect_error(bin_cumulative(3L,-0.5))
})
