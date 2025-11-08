
swiid_index <- dataverse::get_dataset("10.7910/DVN/LM4OWF")
swiid_zip   <- get_file(swiid_index$files$id[1])

zip_path <- tempfile(fileext = ".zip")
writeBin(swiid_zip, zip_path)

rda_tmpdir <- tempfile()
dir.create(rda_tmpdir)

extracted <- unzip(zip_path, exdir = rda_tmpdir)
rda_path  <- extracted[grepl("\\.rda$", extracted, ignore.case = TRUE)][1]
dest_path <- file.path(here("data"), basename(rda_path))

if (file.exists(dest_path)) {
  message("File already exists at: ", dest_path)
} else {
  file.copy(file.path(rda_path), dest_path, overwrite = FALSE)
}