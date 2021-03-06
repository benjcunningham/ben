% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alarm.R
\name{alarm}
\alias{alarm}
\title{Play an alarm}
\usage{
alarm(x = getOption("ben.alarmdefault"))
}
\arguments{
\item{x}{Name of the sound file relative the path specified in
\code{options('ben.alarms')}}
}
\description{
Plays a sound file using Powershell.
}
\examples{
\dontrun{alarm('Sound.wav')}
}
