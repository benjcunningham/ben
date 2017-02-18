#' Combine Excel Sheets by Rows
#' 
#' Take a vector of Excel workbook paths and combine all of the
#' component worksheets by rows.
#' 
#' @param path Vector of file paths representing the Excel documents to
#'   be combined.
#' @param pattern Regular expression to be matched to sheets that should
#'   be combined.
#' @param progress Whether to print verbose messages on the progress of
#'   the method. By default this will only display in an interactive
#'   session.
#'   
#' @return A tibble.
#'
#' @export
bind_excel <- function(path, pattern = NULL, progress = interactive()) {
  
  purrr::map_df(path, function(x) {
    
    if (progress) {
      paste("Processing file:", x) %>%
        message()
    }
    
    bind_excel_(x, pattern, progress)
    
  })
  
}

#' Combine a Single Excel Workbook
#' 
#' @keywords internal
bind_excel_  <- function(path, pattern, progress) {
  
  ss <- readxl::excel_sheets(path)
  
  if (!is.null(pattern)) {
    
    if (progress) {
      
      message("Skipping sheets:")
    
      walk(ss[!grepl(pattern, ss)], function(x) {
        paste("...", x) %>%
          message()
      })
    
    }
    
    ss <- ss[grepl(pattern, ss)]
    
  }
  
  if (progress) {
    message("Binding sheets:")
  }
  
  purrr::map_df(ss, function(x) {
    
    if (progress) {
      paste("...", x) %>%
        message()
    }
    
    readxl::read_excel(path, x) %>%
      dplyr::as_data_frame()
    
  })
   
}
