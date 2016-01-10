context('accumulate')

test_that('Groups accumulate in order', {

  x <- data.frame(
    A = c('A', 'A', 'B', 'A', 'B'),
    B = c(seq(1, 10, 2))
  )

  expect_equal(accumulate(  ~ A, x), c(1, 2, 1, 3, 2))
  expect_equal(accumulate(B ~ A, x), c(1, 4, 5, 11, 14))
  expect_equal(accumulate(B ~ A, x, FUN = cummax), c(1, 3, 5, 7, 9))
  expect_equal(accumulate(B ~ A, x, FUN = cummin), c(1, 1, 5, 1, 5))
  expect_equal(accumulate(B ~ A, x, FUN = cumprod), c(1, 3, 5, 21, 45))

})

test_that('Groups accumulate in reverse order', {

  x <- data.frame(
    A = c('A', 'A', 'B', 'A', 'B'),
    B = c(seq(1, 10, 2))
  )

  expect_equal(accumulate(  ~ A, x, rev = TRUE), c(3, 2, 2, 1, 1))
  expect_equal(accumulate(B ~ A, x, rev = TRUE), c(11, 10, 14, 7, 9))
  expect_equal(accumulate(B ~ A, x, FUN = cummax, rev = TRUE),
               c(7, 7, 9, 7, 9))
  expect_equal(accumulate(B ~ A, x, FUN = cummin, rev = TRUE),
               c(1, 3, 5, 7, 9))
  expect_equal(accumulate(B ~ A, x, FUN = cumprod, rev = TRUE),
               c(21, 21, 45, 7, 9))

})
