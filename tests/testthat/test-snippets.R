context('snip.table')

test_that('Pretty whitespace is properly trimmed', {

  x   <- 'c1 c2 c3\na  b  c\nd  e  f'
  x.s <- 'c1 c2 c3\na b c\nd e f'
  expect_equal(succinct.ws(x), x.s)

  y   <- '\"c1\" \"c2\" \"c3\"\n\"a\"  \"b\"  \"c\"\n\"d\"  \"e\"  \"f\"'
  y.s <- '\"c1\" \"c2\" \"c3\"\n\"a\" \"b\" \"c\"\n\"d\" \"e\" \"f\"'
  expect_equal(succinct.ws(y, '\"'), y.s)

})

test_that('Column vector combining works', {

  x <- letters[1:3]
  x.c <- 'c(\"a\", \"b\", \"c\")'
  expect_equal(combine.vector(x), x.c)

  y <- 1:3
  y.c <- 'c(1, 2, 3)'
  expect_equal(combine.vector(y), y.c)

})
