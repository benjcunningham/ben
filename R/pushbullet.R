# Most things here are modified versions of functions in the RPushbullet
# source or in Karl Broman's personal package:
#   https://github.com/eddelbuettel/rpushbullet/blob/master/R/init.R
#   https://github.com/kbroman/broman/blob/master/R/pushbullet.R

#' Send a message via Pushbullet
#'
#' Sends a message via Pushbullet. This function is just a lazy wrapper
#' around \code{RPushbullet::pbPost}.
#'
#' @param body Body text of message.
#' @param title Title of message.
#' @param \dots Additional parameters to be passed to
#'   \code{RPushbullet::pbPost()}.
#'
#' @rdname pbmsg
#'
#' @export
#' @examples
#' \dontrun{pbmsg('Your script has finished.')}
pbmsg <- function(body = 'Your script is done.',
                  title = 'Notification from R',
                  ...) {

  load_pushbullet()
  RPushbullet::pbPost(title = title, body = body, ...)

}

#' Send errors via Pushbullet
#'
#' Sends all future error messages via Pushbullet. If \code{status} set
#' to \code{FALSE}, future error messages are no longer pushed.
#'
#' @param status Whether or not to send errors.
#' @param \dots Additional parameters to be passed to
#'   \code{RPushbullet::pbPost()}.
#'
#' @rdname pberrors
#'
#' @export
#' @examples
#' \dontrun{
#'   pberrors()
#'   # Some script...
#'   pberrors(FALSE)
#' }
pberrors <- function(status = TRUE, ...) {

  load_pushbullet()
  options(error = function() {
    ifelse(status,
           RPushbullet::pbPost(type = 'note',
                               title = 'Error from R',
                               body = geterrmessage(),
                               ...),
           NULL)
  })

}

#' Load a Pushbullet profile
#'
#' To avoid truly attaching RPushbullet, this function simulates all of
#' the options updates necessary to get the package internals up and
#' running.
#'
#' @keywords internal
load_pushbullet <- function() {

  if (is.null(getOption("rpushbullet.key"))) {

    assign("curl", Sys.which("curl"), envir = RPushbullet:::.pkgenv)

    dotfile <- "~/.rpushbullet.json"

    if (!file.exists(dotfile)) {
      stop("Cannot read ~/.rpushbullet.json")
    }

    pb <- jsonlite::fromJSON(dotfile)
    assign("pb", pb, envir = RPushbullet:::.pkgenv)

    options(
      rpushbullet.key = pb$key,
      rpushbullet.devices = pb$devices,
      rpushbullet.names = pb$names,
      rpushbullet.defaultdevice = pb$defaultdevice %||% 0,
      rpushbullet.testemail = pb$testemail %||% character(),
      rpushbullet.testchannel = pb$testchannel %||% character()
    )

  }

}
