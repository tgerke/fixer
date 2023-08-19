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
  labelled_factors <- dd[vapply(dd$fct_labels, function(x) !is.null(x), TRUE), "var_name"] %>%
    dplyr::pull()

  assign_fct_labels(labelled_factors[4], out, dd)

  purrr::map_df(labelled_factors, \(x) assign_fct_labels(x, out, dd))

}

#' An internal function to assign dictionary labels to factors
#'
#' @param fct_var The variable to which factor levels will be assigned
#' @param data The data frame containing fct_var
#' @param dd A data dictionary object, typically defined by read_dd()
#'
#' @return A updated version of `data` with factor labels assigned
#' @noRd
assign_fct_labels <- function(fct_var, data, dd) {

  # make a named vector for the factor with its labels
  vec_names <- dd[dd$var_name == fct_var, "fct_labels"] %>%
    unlist() %>%
    purrr::map_chr(~ strsplit(.x, ".", fixed = TRUE)[[1]][2]) %>%
    trimws("left")

  fct_labels <- dd[dd$var_name == fct_var, "fct_labels"] %>%
    unlist() %>%
    purrr::map_dbl(~ strsplit(.x, ".", fixed = TRUE)[[1]][1] %>% as.double()) %>%
    rlang::set_names(vec_names)

  data %>%
    labelled::set_value_labels(
      !!fct_var := fct_labels
    )

}
