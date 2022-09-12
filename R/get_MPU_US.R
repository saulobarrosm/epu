#' American monetary policy uncertainty index.
#'
#' Extract American monetary policy uncertainty index.
#'
#' @return A data frame containing American monetary policy uncertainty index.
#'
#' @export
get_MPU_US <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/US_MPU_Monthly.xlsx")
  data <- utils::head(data, -1)
  return(data)
}
