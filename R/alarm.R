#' Play an alarm
#'
#' Plays a sound file using Powershell.
#' @param x Name of the sound file relative the path specified in
#'   \code{options('ben.alarms')}
#' @import magrittr
#' @export
#' @examples
#' \dontrun{alarm('Sound.wav')}
alarm <- function(x) {

  path <-
    getOption('ben.alarms') %>%
    path.expand() %>%
    paste0(., x) %>%
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
