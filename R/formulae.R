#' Convert a vector of characters to a formula
#'
#' Converts a vector-like object of characters to a formula.
#' @param x Vector-like object of explanatory variable names
#' @param y Optional character object of the response variable name
#' @return Object of class \code{formula}, like \code{y ~ x1 + x2}
#' @rdname v2formula
#' @export
#' @examples
#' attrs <- c('x1', 'x2')
#' v2formula(attrs, 'y')
v2formula <- function(x, y) {

  formula <- paste('~', paste(x, collapse = '+'))

  if (!missing(y)) {
    formula <- paste(y, formula)
  }

  as.formula(formula)

}
