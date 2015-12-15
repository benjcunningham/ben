% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/pushbullet.R
\name{pberrors}
\alias{pberrors}
\title{Send errors via Pushbullet}
\usage{
pberrors(status = TRUE, ...)
}
\arguments{
\item{status}{Whether or not to send errors}
}
\description{
Sends all future error messages via Pushbullet. If \code{status} set
to \code{FALSE}, future error messages are no longer pushed.
}
\examples{
\dontrun{
  pberrors()
  # Some script...
  pberrors(FALSE)
}
}
