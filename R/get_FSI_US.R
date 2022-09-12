#' American financial stress indicator.
#'
#' Extract American financial stress indicator.
#'
#' @return A data frame containing American financial stress indicator.
#'
#' @export
get_FSI_US <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Financial_Stress.xlsx")
  return(data)
}
