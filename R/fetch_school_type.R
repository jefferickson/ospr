#' Fetch school types for BNs
#' 
#' Fetch a vector of school types from a vector of BNs.
#' @param bns A vector or list of BNs
#' @param sqr_official_dir The directory of SAS datasets to use. Must be an SQR official directory.
#' @param report_type Report report_type instead of school_type? Default: FALSE
#' @param collapse_types Should multiple school_types be collapsed when possible? Default: TRUE
#' @return A vector of school_types or report_types
#' @examples
#' my.data$school_type <- fetch_school_type(my.data$bn, sqr_2014_local)
#' @export
fetch_school_type <- function(bns, sqr_official_dir, report_type = FALSE, collapse_types = TRUE) {
  ems <- ospr::load_sqr_dataset("schallems_targets", sqr_official_dir)
  hs <- ospr::load_sqr_dataset("schallhs_targets", sqr_official_dir)
  
  if (report_type) {
    school_types_stacked <- rbind(ems[c("dbn", "report_type")], hs[c("dbn", "report_type")])
  } else {
    school_types_stacked <- rbind(ems[c("dbn", "school_type")], hs[c("dbn", "school_type")])
  }
  
  lookup_school_type <- function(bn) {
    school_type <- school_types_stacked[substr(school_types_stacked$dbn, 3, 6) == bn, 2]
    
    if (collapse_types) {
      if (all(school_type == c("Middle", "High School"))) {
        school_type <- "6-12"
      } else if (all(school_type == c("K-8", "High School"))) {
        school_type <- "K-12"
      }
    }
    
    return(school_type)
  }
  
  return(sapply(bns, lookup_school_type))
}
