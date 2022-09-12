#' State-Level American economic policy uncertainty index
#'
#' Extract State-Level American economic policy uncertainty index.
#'
#' @return A data frame containing State-Level American EPU index.
#'
#' @export
get_sEPU_US <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/State_Policy_Uncertainty.xlsx")
  return(data)
}
