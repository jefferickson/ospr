#' Run a query on a SQL server.
#'
#' Run a query on a sQL server and return the result as a dataframe.
#' @param dbh A database handle. Use sql15(), sql27(), or sqlord() for typical DOE SQL servers.
#' @param query The query you want to run. Make sure to include the database and table schema in the table name (e.g. \code{spr_int.prl.extract_school_data}).
#' @return A dataframe of the data returned by the query.
#' @examples
#' school_data <- query_sql_server(sql27(), "select dbn, quality_review_score from spr_int.prl.extract_school_data where year = 2013")
#' @export
query_sql_server <- function(dbh, query) {
  return(RODBC::sqlQuery(dbh, query))
}
