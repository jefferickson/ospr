#' Import a SQR/PR SAS dataset 
#'
#' Import a SQR/PR SAS dataset from a given directory.
#' @param dataset_name The name of the SAS dataset you want to import.
#' @param sas_dir The directory of the dataset you want to import. Use helper functions if it is a common directory.
#' @return A dataframe of the imported SAS dataset.
#' @examples
#' demmutableforstu <- load_sqr_dataset('demmutableforstu', sqr_ems_unofficial_2014())
#' @export
load_sqr_dataset <- function(dataset_name, sas_dir) {
  return(haven::read_sas(paste(sas_dir, paste(dataset_name, ".sas7bdat", sep = ''), sep = "\\")))
}  
