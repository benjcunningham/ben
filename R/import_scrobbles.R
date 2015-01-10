#' Import a Last.fm scrobbles sheet as a data frame.
#'
#' This function initializes a data frame of Last.fm scrobbles.
#' @param file The name of the file which the scrobble data is to be read from.
#' @param header A logical value indicating whether the file contains the names of the variables as its first line.
#' @param date.fmt The date format that should be used in the returned data frame.
#' @return A data frame with columns Artist, Album, Song, and Date.
#' @examples import_scrobbles("scrobbles.csv")

import_scrobbles <- function(file,
                             header = FALSE,
                             date.fmt = "%d %b %Y %H:%M") {
  
  scrobbles <- read.csv(
    file,
    header = header,
    stringsAsFactors = FALSE
  )
  
  nms <- c(
    "Artist",
    "Album",
    "Song",
    "Date"
  )
  
  names(scrobbles) <- nms
  
  scrobbles$Date <- strptime(
    scrobbles$Date,
    format = date.fmt
  )
  
  scrobbles
  
}