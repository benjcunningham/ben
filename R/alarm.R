#' Play an alarm
#'
#' Plays a sound file using Powershell.
#' @param x Location of the sound file.
#' @export
alarm <- function(x) {

  file.loc <- x

  cmd <-
    paste0('start powershell -windowstyle hidden -c (New-Object Media.SoundPlayer "',
           file.loc,
           '").PlaySync();')

  shell(cmd)

}
