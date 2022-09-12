#' Categorical American economic policy uncertainty index
#'
#' Extract categorical American economic policy uncertainty index.
#'
#' @return A data frame containing categorical American EPU index.
#'
#' @export
get_cEPU_US <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Categorical_EPU_Data.xlsx")
  data <- utils::head(data, -1)
  data$Date <- openxlsx::convertToDate(data$Date)
  return(data)
}
