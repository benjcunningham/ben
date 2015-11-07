#' Play an alarm
#'
#' Plays a sound file using Powershell.
#' @param x Location of the sound file relative the path specified in
#'   \code{ben.options('path.alarms')}
#' @export
alarm <- function(x) {

  path <-
    ben.options('path.alarms') %>%
    path.expand() %>%
    paste0(x) %>%
    normalizePath() %>%
    paste0('cmd /c for %A in ("', ., '") do @echo %~sA') %>%
    shell(intern = TRUE)

  cmd <- paste0(
    'start powershell -windowstyle hidden -c (New-Object Media.SoundPlayer "',
    path,
    '").PlaySync();'
  )

  shell(cmd)

}
