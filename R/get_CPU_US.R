#' American climate policy uncertainty index.
#'
#' Extract American climate policy uncertainty index.
#'
#' @return A data frame containing American climate policy uncertainty index.
#'
#' @export
get_CPU_US <- function () {
  data <- utils::read.csv("https://www.policyuncertainty.com/media/CPU%20index.csv")
  colnames(data)<-data[2,]
  data <- utils::tail(data, -2)
  return(data)
}
