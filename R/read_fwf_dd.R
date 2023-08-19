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

  # set variable labels
  out <- fwf %>%
    labelled::set_variable_labels(.labels = dd$var_label)

  # set factor labels when relevant

  # this base R filter is needed because dplyr::filter doesn't like list cols
  labelled_factors <- dd[vapply(dd$fct_labels, function(x) !is.null(x), TRUE),]

  # make a named vector for each factor and its labels
  vec_names <- labelled_factors[1, "fct_labels"] %>%
    unlist() %>%
    purrr::map_chr(~ strsplit(.x, ". ", fixed = TRUE)[[1]][2])

  fct_labels <- labelled_factors[1, "fct_labels"] %>%
    unlist() %>%
    purrr::map_dbl(~ strsplit(.x, ". ", fixed = TRUE)[[1]][1] %>% as.double()) %>%
    rlang::set_names(vec_names)

  out %>%
    labelled::set_value_labels(
      racebld = fct_labels
    )

  return(out)
}
