#' Migration fears and EPU
#'
#' Extract migration fears and economic policy uncertainty indices of France, Germany, U.K and the U.S.
#'
#' @return A data frame containing migration fears and EPU indices.
#'
#' @export
get_MF_EPU <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/Migration_Fear_EPU_Data.xlsx")
  return(data)
}
