#' Economic policy uncertainty indices
#'
#' Extract economic policy uncertainty indices of several countries.
#'
#' @return A data frame containing EPU indices.
#'
#' @export
get_EPU <- function () {
  data <- openxlsx::read.xlsx("https://www.policyuncertainty.com/media/All_Country_Data.xlsx")
  databr <- utils::read.csv2("https://raw.githubusercontent.com/saulobarrosm/epuBR/main/final_br.csv")
  data$Month <- base::with(data,  base::paste0("0", data$Month))
  data$Month <- base::substr(data$Month, base::nchar(data$Month)-1, base::nchar(data$Month))
  data$date <- base::with(data,  base::paste0(data$Year,"-", data$Month,"-01"))
  data[ , base::c('Year', 'Month')] <- list(NULL)
  databr$X <- NULL
  data_global <- base::merge(data, databr, by = "date", all = TRUE)
  #data_global <- utils::head(data_global, -28)
  return(data_global)
}
