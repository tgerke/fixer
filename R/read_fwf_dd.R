#' An internal function to access example data files
#'
#' @param path Optional string of file name or path within "extdata" to seek
#'
#' @return A local path to example files within "extdata" of {fixer}
#' @noRd
#'
#' @examples
#' fixer:::read_fwf_example()
#' fixer:::read_fwf_example("example-fwf-data.dat")
read_fwf_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "fixer"))
  } else {
    system.file("extdata", path, package = "fixer", mustWork = TRUE)
  }
}

#' Read a fwf data dictionary file
#'
#' Makes some assumptions about the structure of the data dictionary file. (I
#' think, but TODO let's describe these if that ends up being true).
#'
#' @param path Path to the data dictionary file
#' @param skip Number of lines to skip before reading data
#'
#' @return Arguments to readr::read_fwf and labelled::set_variable_labels
#' @export
#'
#' @examples
#' fixer:::read_fwf_example("example-fwf-dictionary.dd") |>
#'   read_fwf_dd(skip = 2)
read_fwf_dd <- function(path, skip = 0) {

  # check that the supplied path points to a valid file
  stopifnot(
    "Supplied `path` does not point to a file that exists" =
      file.exists(path)
  )

  dd_lines <- readr::read_lines(path, skip = skip)

  # identify which rows define variable names by finding preceding blank rows
  index_rows <- which(vapply(dd_lines, nchar, 1L, USE.NAMES = FALSE) == 0) + 1
  # read a tibble of variable names
  var_names <- dd_lines[index_rows] %>%
    # handle the edge-cases where tabs are encoded as spaces
    vapply(function(x) gsub("       ", "\t", x), "a", USE.NAMES = FALSE) %>%
    vapply(function(x) gsub("      ", "\t", x), "a", USE.NAMES = FALSE) %>%
    vapply(function(x) gsub("		", "\t", x), "a", USE.NAMES = FALSE) %>%
    paste(collapse = "\n") %>%
    readr::read_delim(
      col_names = c("var_name", "var_width", "var_colstart", "var_label"),
      delim = "\t"
    )
  # strip the "i" from column widths
  var_names <- var_names %>%
    dplyr::mutate(var_width = as.integer(gsub("i", "", .data$var_width)))

  # identify which rows start chunks of variable labels
  label_ind <- which(grepl("$label", dd_lines, fixed = TRUE))
  # find the variable that each label corresponds to, along with chunk locations
  var_labels <- dplyr::tibble(
    var_name = character(length = length(label_ind)),
    label_start = integer(length(label_ind)),
    label_end = integer(length(label_ind))
  )
  for (i in 1:length(label_ind)) {
    var_labels$var_name[i] <- var_names$var_name[sum(index_rows <= label_ind[i])]
    var_labels$label_start[i] <- label_ind[i]
    if (i < length(label_ind)) {
      var_labels$label_end[i] <- min(index_rows[index_rows >= label_ind[i]]) - 2
    } else{
      var_labels$label_end[i] <- length(dd_lines)
    }
  }

}
