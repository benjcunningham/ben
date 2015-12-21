context('str_convert')

test_that('Currency vectors covert to numerics', {

  usd <- c('$81,017.85', '$10,119.99', '$70,518.50')
  eur <- c('81 017,85€', '10 119,99€', '70 518,50€')
  chf <- c('SFr 81,017.85', 'SFr 10,119.99', 'SFr 70,518.50')

  num <- c(81017.85, 10119.99, 70518.50)

  expect_equal(c2numeric(usd), num)
  expect_equal(c2numeric(eur, dm = ','), num)
  expect_equal(c2numeric(chf), num)

})
