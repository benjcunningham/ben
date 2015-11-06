#' Play an alarm
#'
#' Plays a sound file using Powershell.
#' @param x Location of the sound file.
#' @export
alarm <- function(x) {

  cmd <- cat(
    'start powershell -windowstyle hidden -c ',
    '(New-Object Media.SoundPlayer "',
    ben.options('path.alarms'),
    x,
    '").PlaySync();',
    sep = ''
  )

  shell(cmd)

}

paste0(
  'start powershell -windowstyle hidden -c (New-Object Media.SoundPlayer "',

  '").PlaySync();'
)

paste0(1,2)
