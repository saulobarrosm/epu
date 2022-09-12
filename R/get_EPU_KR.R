#' Korean economic policy uncertainty index
#'
#' Extract Korean economic policy uncertainty index.
#'
#' @return A data frame containing Korean EPU index.
#'
#' @export
get_EPU_KR <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Korea_Overall_EPU.xlsx")
  data <- data[,1:2]
  data$Date <- openxlsx::convertToDate(data$Date)
  return(data)
}
