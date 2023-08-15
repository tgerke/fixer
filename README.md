
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fixer

<!-- badges: start -->
<!-- badges: end -->

Some fixed-width files (fwf) are created with a complementary data
dictionary. Such dictionaries contain metadata such as column widths,
variable types, and variable labels. The `{fixer}` package reads
fixed-width files according to their data dictionary.

## Installation

You can install the development version of fixer like so:

``` r
devtools::install_github("tgerke/fixer")
```

## UNDER DEVELOPMENT

``` r
library(fixer)

dd <- fwiffer:::read_fwf_example("example-fwf-dictionary.dd") |> 
  read_fwf_dd(skip = 2)

dd
#> # A tibble: 13 × 8
#>    var_name  var_row col_width col_start var_label           fct_label_start_row
#>    <chr>       <dbl>     <int>     <dbl> <chr>                             <int>
#>  1 id              2         6         1 ID number                            NA
#>  2 cd              4         2         7 check digit for id                   NA
#>  3 racebld         6         1         9 Ancestry                              7
#>  4 yobenr         12         2        10 Year of enrollment…                  NA
#>  5 smokebld       14         1        12 Smoking Status 202…                  15
#>  6 mnthbld        21         4        13 Date enrolled in m…                  NA
#>  7 timebld        23         2        17 Hour of the day of…                  25
#>  8 fastbld        38         1        19 Enrolled in person                   39
#>  9 prob4bld       42         1        20 Enrollment problem…                  43
#> 10 prob5bld       45         1        21 Enrollment problem…                  46
#> 11 prob9bld       48         1        22 Enrollment problem…                  49
#> 12 prob10bld      51         1        23 Enrollment problem…                  52
#> 13 prob18bld      54         1        24 Enrollment problem…                  55
#> # ℹ 2 more variables: fct_label_end_row <dbl>, fct_labels <list>

dplyr::glimpse(dd)
#> Rows: 13
#> Columns: 8
#> $ var_name            <chr> "id", "cd", "racebld", "yobenr", "smokebld", "mnth…
#> $ var_row             <dbl> 2, 4, 6, 12, 14, 21, 23, 38, 42, 45, 48, 51, 54
#> $ col_width           <int> 6, 2, 1, 2, 1, 4, 2, 1, 1, 1, 1, 1, 1
#> $ col_start           <dbl> 1, 7, 9, 10, 12, 13, 17, 19, 20, 21, 22, 23, 24
#> $ var_label           <chr> "ID number", "check digit for id", "Ancestry", "Ye…
#> $ fct_label_start_row <int> NA, NA, 7, NA, 15, NA, 25, 39, 43, 46, 49, 52, 55
#> $ fct_label_end_row   <dbl> NA, NA, 10, NA, 19, NA, 36, 40, 43, 46, 49, 52, 55
#> $ fct_labels          <list> <NULL>, <NULL>, <"1. White", "2. European", "3. As…
```
