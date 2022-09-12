#' Japanese economic policy uncertainty index
#'
#' Extract Japanese economic policy uncertainty index several countries.
#'
#' @return A data frame containing Japanese EPU index.
#'
#' @export
get_EPU_JP <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Japan_Policy_Uncertainty_Data.xlsx")
  data <- data[,1:3]
  return(data)
}
