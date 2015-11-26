#' Render code for a matrix-like object on the clipboard
#'
#' Given some delimited structure on the clipboard or in the session,
#' this function renders R code to structure the object as a data frame.
#' The resulting code is written to the clipboard.
#' @param tbl Matrix-like object; if not given, retrieves from the
#'   clipboard
#' @param delim The field separator character
#' @param ... Further arguments to be passed to `readr::read_delim`
#' @import magrittr
#' @rdname snip.table
#' @export
#' @examples
#' \dontrun{
#' # Put some table like this on the clipboard:
#' # mpg cyl disp
#' # 210 685 87
#' # 210 610 160
#' # 710 228 4
#' snip.table()
#'
#' # Or like this:
#' # 210 685 87
#' # 210 610 160
#' # 710 228 4
#' snip.table(col_names = FALSE)
#'
#' # Or read from a session object:
#' y <- data.frame(a = c(2,4,6), b = c(4,16,32))
#' snip.table(y)
#' }
snip.table <- function(tbl, delim = ' ', ...) {

  if (missing(tbl)) {

    tbl <-
      clipr::read_clip() %>%
      paste0(collapse = '\n') %>%
      succinct.ws(...) %>%
      readr::read_delim(delim = delim, ...)

  }

  output_code <-
    tbl %>%
    sapply(function(x) combine.vector(x)) %>%
    add.names() %>%
    paste(collapse = ',\n') %>%
    paste0('data.frame(\n', ., '\n)')

  clipr::write_clip(output_code)

  invisible(output_code)

}

#' Render column names for code
#'
#' @return Vector of named column strings
#' @keywords internal
add.names <- function(vec) {

  names(vec) %>%
  lapply(function(x) paste(x, '=', vec[x]))

}

#' Render column strings for code
#'
#' @return Character string of column code
#' @keywords internal
combine.vector <- function(x) {

  use_quotes <- !typeof(x) %in% c('integer', 'double')

  cc <- ifelse(rep(use_quotes, 3),
               c('", "', 'c("', '")'),
               c(', ', 'c(', ')'))

  paste(x, collapse = cc[1]) %>%
    paste0(cc[2], ., cc[3])

}

#' Strip extra whitespace used for formatting columns
#'
#' @return Character string
#' @keywords internal
succinct.ws <- function(x, quote) {

  rgx <- '[\t ]+'

  if (!missing(quote)) {
    rgx <- paste0(rgx, '(?:(?<=[', quote, '])|(?=[', quote, ']))')
  }

  gsub(rgx, ' ', x, perl = TRUE)

}
