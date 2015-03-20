#' Get a database handle for ORD's SQL server.
#'
#' Get a database handle for ORD's SQL server.
#' @return A database handle.
#' @examples
#' dbhord <- sqlord()
#' @export
sqlord <- function() {
  return(RODBC::odbcDriverConnect("driver={SQL Server};server=10.2.25.236,15050;trusted_connection=TRUE"))
}
