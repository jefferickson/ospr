#' Get a database handle for SQL Server 15.
#'
#' Get a database handle for mtsqlvs15/mtsqlins15.
#' @return A database handle.
#' @examples
#' dbh15 <- sql15()
#' @export
sql15 <- function() {
  return(RODBC::odbcDriverConnect("driver={SQL Server};server=mtsqlvs15\\mtsqlins15;trusted_connection=TRUE"))
}
