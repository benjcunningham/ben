#' ben
#'
#' Personal R package of Ben Cunningham.
#'
#' @section Package Options:
#'
#' The following options should be set in \code{.Rprofile} to customize
#' the behavior of some functions.
#'
#' \itemize{
#'
#'  \item \code{ben.alarms}: Directory of sound assets; for example
#'    \code{~/R/alarms/}
#'
#' }
#'
#' To take advantage of the Pushbullet notification wrappers,
#' \code{RPushbullet} should be configured with
#' \code{~/.rpushbullet.json} or equivalent global options.
#'
#' @docType package
#' @name ben
#' @importFrom dplyr %>%
NULL

# Quiets R CMD check NOTEs for `.` in pipelines
utils::globalVariables(c("."))
