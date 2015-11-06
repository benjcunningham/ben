#' Define package options.
#'
#' @param ... Either \code{key = value pairs} or the names of the
#' options to retrieve.
#' @return List of options. If nothing is passed, a list of all options
#' is returned.
#' @rdname options
#' @examples
#' ben.options()
#' ben.options('path.alarms')
#' ben.options(path.alarms = '~')
#' @export
ben.options <- function(...) {
  stop_if_reserved(...)
  .options(...)
}


#' @rdname options
#' @import settings
.options <- options_manager(
  path.alarms = '~/R/alarms/'
)
