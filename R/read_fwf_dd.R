#' Read a fixed-width file when given a dictionary
#'
#' @param path_fwf Path to the fixed-width file
#' @param dd A data dictionary object, typically defined by read_dd()
#'
#' @return A tibble
#' @export
#'
#' @examples
#' dd <- fixer:::read_fwf_example("example-fwf-dictionary.dd") |>
#'   read_dd(skip = 2)
#' fixer:::read_fwf_example("example-fwf-data.dat") |>
#'   read_fwf_dd(dd)
read_fwf_dd <- function(path_fwf, dd) {
  fwf <- readr::read_fwf(
    file = path_fwf,
    col_positions = readr::fwf_widths(dd$col_width, dd$var_name)
  )
}
