#' Import a Last.fm scrobbles sheet as a data frame.
#'
#' This function initializes a data frame of Last.fm scrobbles.
#' @param file The name of the file which the scrobble data is to be read from.z
#' @param header A logical value indicating whether the file contains the names of the variables as its first line.
#' @return A data frame with columns Artist, Album, Song, and Date.
#' @examples \dontrun{
#' import_scrobbles(file = "scrobbles.csv")
#' }

import_scrobbles <- function(file,
                             header = FALSE){
  
  scrobbles <- read.csv(
    file,
    header = header
  )
  
  nms <- c(
    "Artist",
    "Album",
    "Song",
    "Date"
  )
  
  names(scrobbles) <- nms
  
  scrobbles
  
}