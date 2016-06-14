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

  RPushbullet::pbPost(title = title,
                      body = body,
                      ...)

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

  options(error = function() {
    ifelse(status,
           RPushbullet::pbPost(type = 'note',
                               title = 'Error from R',
                               body = geterrmessage(),
                               ...),
           NULL)
  })

}
