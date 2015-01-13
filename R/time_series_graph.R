#' Create a time series graph of column subsets and their cumulative frequencies.
#'
#' This function returns a ggplot time series graph of a column, with frequencies grouped by a subset of the column's values.
#' @param df The data frame in which row frequencies are to be calculated. The object should contain a column of dates.
#' @param row.subset A subset of df.col values corresponding to the time series graph groups.
#' @param df.col The name of the column upon which row frequencies should be calculated.
#' @param date.col The name of the column that contains dates.
#' @param size A numeric corresponding to line size in the returned plot.
#' @import ggplot2
#' @export
#' @return A ggplot time series graph of frequencies within a column grouped by row.
#' @examples time_series_graph(df, c("Artist 1", "Artist 2"))

time_series_graph <- function(df,
                              row.subset,
                              df.col = "Artist",
                              date.col = "Date",
                              size = 1) {
  
  df$Count <- rev(
    ave(
      df[[eval(df.col)]] == df[[eval(df.col)]],
      rev(df[[eval(df.col)]]),
      FUN = cumsum
    )
  )
  
  tsg <- ggplot(
    df[df[[eval(df.col)]] %in% row.subset, ],
    aes_string(
      x = date.col,
      y = "Count",
      group = df.col,
      colour = df.col
    )
  ) +
  geom_line(
    size = size
  )
  
  tsg
  
}