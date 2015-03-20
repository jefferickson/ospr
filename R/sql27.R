#' Get a database handle for SQL Server 27.
#'
#' Get a database handle for mtsqlvs27/mtsqlins27.
#' @return A database handle.
#' @examples
#' dbh27 <- sql27()
#' @export
sql27 <- function() {
  return(RODBC::odbcDriverConnect("driver={SQL Server};server=mtsqlvs27\\mtsqlins27;trusted_connection=TRUE"))
}
