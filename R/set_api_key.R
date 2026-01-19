#' Set Dataverse API Key
#'
#' @param api_key Your Dataverse API key from Harvard Dataverse
#' @param server Dataverse server URL, default is "dataverse.harvard.edu"
#' @param install Whether to save to .Renviron for persistent use
#' @return Invisibly returns TRUE if successful
#' @export
#' @examples
#' \dontrun{
#' set_api_key("your-api-key-here")
#' set_api_key("your-api-key-here", install = TRUE)
#' }
set_api_key <- function(api_key,
                        server = "dataverse.harvard.edu",
                        install = FALSE) {

  if (missing(api_key) || is.null(api_key) || api_key == "") {
    stop("Please provide a valid API key.")
  }

  Sys.setenv(DATAVERSE_KEY = api_key)
  Sys.setenv(DATAVERSE_SERVER = server)

  message("API key set for current session")

  if (install) {
    .install_api_key(api_key, server)
  }

  invisible(TRUE)
}

.install_api_key <- function(api_key, server) {
  home <- Sys.getenv("HOME")
  renv <- file.path(home, ".Renviron")

  if (file.exists(renv)) {
    lines <- readLines(renv)
  } else {
    lines <- character()
  }

  lines <- lines[!grepl("^DATAVERSE_KEY=", lines)]
  lines <- lines[!grepl("^DATAVERSE_SERVER=", lines)]
  lines <- c(lines,
             paste0("DATAVERSE_KEY=", api_key),
             paste0("DATAVERSE_SERVER=", server))

  writeLines(lines, renv)
  message("API key saved to .Renviron")
}
