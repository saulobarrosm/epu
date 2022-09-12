#' Brazilian economic uncertainty index
#'
#' Extract Brazilian economic uncertainty index.
#'
#' @return A data frame containing Brazilian economic uncertainty index.
#'
#' @export
get_EU_BR <- function () {
  data <- utils::read.csv2("https://www.policyuncertainty.com/media/FGV%20Brazilian%20Economic%20Uncertainty%20Indicator.csv")
  return(data)
}
