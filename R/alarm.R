#' Play an alarm
#'
#' Plays a sound file using Powershell.
#' @param x Name of the sound file relative the path specified in
#'   \code{options('ben.alarms')}
#' @export
#' @examples
#' \dontrun{alarm('Sound.wav')}
alarm <- function(x = getOption("ben.alarmdefault")) {

  root <- path.expand(getOption("ben.alarms"))
  os <- Sys.info()["sysname"]

  if (os == "Windows") {

    path <-
      normalizePath(file.path(root, x)) %>%
      sprintf("cmd /c for %%A in (\"%s\") do @echo %%~sA", .) %>%
      system(intern = TRUE)

    code <-
      sprintf("(New-Object Media.SoundPlayer \"%s\").PlaySync();", path) %>%
      shell(shell = "powershell", wait = FALSE)

  } else {

    code <- -1

  }

  return(invisible(code))

}
