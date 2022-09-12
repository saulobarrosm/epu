#' Geopolitical risk from North Korea index
#'
#' Extract geopolitical risk from North Korea index.
#'
#' @return A data frame containing geopolitical risk from North Korea index.
#'
#' @export
get_GPRNK <- function () {
  data <- utils::read.csv("https://www.policyuncertainty.com/media/GPRNK_Data.csv")
  colnames(data)<-data[2,]
  data <- utils::tail(data, -2)
  return(data)
}
