#' Convert a currency-formatted string to a numeric
#'
#' Converts a string formatted as some currency to a numeric.
#' @param x Character vector to be converted
#' @param dm Decimal mark used in the currency format
#' @import magrittr
#' @rdname c2numeric
#' @export
#' @examples
#' c2numeric('$432.99')
#'
#' c('€5000,00', '€432,00', '€100') %>%
#'   c2numeric(dm = ',')
c2numeric <- function(x, dm = '.') {

  paste0('[', dm, ']') %>%
    gsub('.', x) %>%
    gsub('[^0-9.-]', '', .) %>%
    as.numeric()

}
