test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("Stars don't appear when they shouldnt", {
  res <- datasummary_correlation(
    correlation::correlation(mtcars[, 1:3]),
    stars = FALSE,
    output = "data.frame"
  )
  res <- grepl("*", res[3, 3], fixed = TRUE)
  expect_false(res)
})

test_that("Custom stars appear in output when defined", {
  res <- datasummary_correlation(
    correlation::correlation(mtcars[, 1:3]),
    stars = c("***" = 0.05),
    output = "data.frame"
  )
  res <- grepl("***", res[3, 3], fixed = TRUE)
  expect_true(res)
})
