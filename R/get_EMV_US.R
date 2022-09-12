#' American equity market volatility index
#'
#' Extract American equity market volatility index.
#'
#' @return A data frame containing American equity market volatility index.
#'
#' @export
get_EMV_US <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/EMV_Data.xlsx")
  data <- utils::head(data, -1)
  return(data)
}
