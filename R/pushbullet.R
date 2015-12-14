#' Send a message via Pushbullet
#'
#' Sends a message via Pushbullet.
#' @param body Body text to be used in message.
#' @param title Title to be used in message.
#' @rdname pbmsg
#' @export
#' @examples
#' \dontrun{pbmsg('Your script has finished.')}
pbmsg <- function(body = 'Your script is done.',
                  title = 'Notification from R') {

  RPushbullet::pbPost(type = 'note',
                      title = title,
                      body = body)

}

#' Send errors via Pushbullet
#'
#' Sends all future error messages via Pushbullet. If \code{status} set
#' to \code{FALSE}, future error messages are no longer pushed.
#' @param status Whether or not to send errors
#' @rdname pberrors
#' @export
#' @examples
#' \dontrun{
#'   pberrors()
#'   # Some script...
#'   pberrors(FALSE)
#' }
pberrors <- function(status = TRUE) {

  options(error = function() {
    ifelse(status,
           RPushbullet::pbPost('note',
                               'Error from R',
                               geterrmessage()),
           NULL)
    })

}
