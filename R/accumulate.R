#' Cumulative Sums, Product, and Extremes by Subset
#'
#' Returns a vector whose elements are the cumulative sums, products,
#' minima, or maxima of the elements in data frame, according to a
#' specified grouping.
#' @param formula An object of class \code{formula} that symbolizes how
#'   elements should be group and which dependent element should be
#'   accumulated.
#' @param data A data frame containing the variables in the formula.
#' @param FUN Function to apply to each group.
#' @param rev Whether or not to perform \code{FUN} on a reversed
#'   ordering of elements in \code{data}.
#' @return A vector of accumulated values
#' @import magrittr
#' @rdname accumulate
#' @export
#' @examples
#' df <- data.frame(X1 = c('a', 'b', 'b', 'b', 'a', 'a', 'b'),
#'                  X2 = c('c', 'c', 'd', 'c', 'd', 'd', 'c'),
#'                  C1 = c(2, 5, 1, 7, 3, 1, 2))
#' accumulate(C1 ~ X1 + X2, df, FUN = cumsum)
accumulate <- function(formula, data, FUN = cumsum, rev = FALSE) {

  if (rev) {
    data <- data.frame(data[rev(rownames(data)), ])
  }

  y <-
    ifelse(
      attr(terms(formula), 'response'),
      paste0('data$', all.vars(formula)[[1]]),
      paste0('rep(1, ', nrow(data), ')')
    )

  g <-
    attr(terms(formula), 'term.labels') %>%
    paste(., collapse = ', data$') %>%
    paste0('list(data$', ., ')')

  ave(
    eval(parse(text = y)),
    eval(parse(text = g)),
    FUN = FUN
  ) %>%
  {if (rev) rev(.) else .}

}
