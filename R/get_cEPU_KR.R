#' Categorical Korean economic policy uncertainty index
#'
#' Extract categorical Korean economic policy uncertainty index.
#'
#' @return A data frame containing categorical Korean EPU index.
#'
#' @export
get_cEPU_KR <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Korea_Categorical_PU_Indices.xlsx")
  data <- data[,1:5]
  data$Date <- openxlsx::convertToDate(data$Date)
  return(data)
}
