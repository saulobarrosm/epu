#' Categorical Greek economic policy uncertainty index
#'
#' Extract categorical Greek economic policy uncertainty index.
#'
#' @return A data frame containing categorical Greek EPU index.
#'
#' @export
get_cEPU_GR <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/HKKS_Greece_Policy_Uncertainty_Data.xlsx")
  data$Date2 <- openxlsx::convertToDate(data$Date)
  data$Date<- lubridate::dmy(data$Date, quiet= TRUE)
  data$Date[is.na(data$Date)] <- data$Date2[is.na(data$Date)]
  data$Date2 <- NULL
  return(data)
}
