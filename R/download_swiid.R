#' Download SWIID Dataset from Dataverse
#'
#' @param dest_dir Destination directory, default is "data"
#' @param overwrite Whether to overwrite existing file
#' @return Path to downloaded .rda file
#' @export
#' @examples
#' \dontrun{
#' # First set API key
#' set_api_key("your-api-key-here")
#'
#' # Then download
#' download_swiid()
#' download_swiid(dest_dir = "my_data")
#' }
download_swiid <- function(dest_dir = "data", overwrite = FALSE) {

  # API key check
  if (Sys.getenv("DATAVERSE_KEY") == "") {
    stop("No API key found. Please run: set_api_key('your-key-here')")
  }

  message("Downloading SWIID dataset from Dataverse...")

  swiid_index <- dataverse::get_dataset(
    "10.7910/DVN/LM4OWF",
    server = "dataverse.harvard.edu"
  )

  swiid_zip <- dataverse::get_file(swiid_index$files$id[1])

  zip_path <- tempfile(fileext = ".zip")
  writeBin(swiid_zip, zip_path)

  rda_tmpdir <- tempfile()
  dir.create(rda_tmpdir)

  extracted <- unzip(zip_path, exdir = rda_tmpdir)

  rda_path <- extracted[grepl("\\.rda$", extracted, ignore.case = TRUE)][1]


  if (!dir.exists(dest_dir)) {
    dir.create(dest_dir, recursive = TRUE)
  }

  dest_path <- file.path(dest_dir, basename(rda_path))

  if (file.exists(dest_path) && !overwrite) {
    message("File already exists at: ", dest_path)
  } else {
    file.copy(rda_path, dest_path, overwrite = overwrite)
    message("Successfully downloaded to: ", dest_path)
  }

  invisible(dest_path)
}
