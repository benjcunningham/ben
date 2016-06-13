#' Knit a simulated HTML fragment
#'
#' Renders an R Markdown document as HTML, minus the <!DOCTYPE html>
#' declaration. Useful as an intermediate step in serving an R Markdown
#' document with htmlwidget-like content as a Jekyll post.
#'
#' @param input Path of the R Markdown document to be rendered.
#' @param output_dir Directory where the rendered HTML should be
#'   written.
#' @param \dots Additional arguments to be passed to
#'   \code{rmarkdown::render}.
#' @param verbose Logical indicating whether to print informative
#'   messages.
#'
#' @return Invisible TRUE, no matter what.
#'
#' @export
knit_htmlwidgets <- function(input,
                             output_dir = "./_includes/htmlwidgets",
                             ...,
                             verbose = TRUE) {

  file_name <- rev(unlist(strsplit(input, split = "/")))[1]

  path <- rmarkdown::render(input,
                            "html_document",
                            output_dir = output_dir,
                            ...)

  removed <- remove_doctype(path)

  if (verbose) {
    message(sprintf(paste0(
      "File rendered at: %s\n",
      "DOCTYPE declarations removed: %s"
    ), path, removed))
  }

  return(invisible(TRUE))

}

#' Strip <!DOCTYPE html> from a file
#'
#' Rewrites an HTML file with the <!DOCTYPE html> tag removed.
#'
#' @param input Path of the HTML file.
#'
#' @return Integer indicating how many lines were removed. Should
#'   generally only return 1, but the number may be useful for debugging
#'   unexpected behavior.
#'
#' @keywords internal
remove_doctype <- function(input) {

  html_lines <- readLines(input)
  keep <- grep("^<!DOCTYPE html>$", html_lines, invert = TRUE)

  writeLines(html_lines[keep], input)

  return(length(html_lines) - length(keep))

}
