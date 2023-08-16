
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
  read_dd(skip = 2)

fwf_data <- fixer:::read_fwf_example("example-fwf-data.dat") |>
  read_fwf_dd(dd)

str(fwf_data)
#> spc_tbl_ [50 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
#>  $ id       : num [1:50] 538197 538199 538202 538205 538307 ...
#>   ..- attr(*, "label")= chr "ID number"
#>  $ cd       : num [1:50] 70 76 17 26 32 44 44 42 63 54 ...
#>   ..- attr(*, "label")= chr "check digit for id"
#>  $ racebld  : num [1:50] 1 1 1 1 1 1 1 1 1 1 ...
#>   ..- attr(*, "label")= chr "Ancestry"
#>  $ yobenr   : num [1:50] 21 22 22 22 22 21 22 23 24 25 ...
#>   ..- attr(*, "label")= chr "Year of enrollment (last two digits)"
#>  $ smokebld : num [1:50] 1 2 2 2 2 2 1 2 1 2 ...
#>   ..- attr(*, "label")= chr "Smoking Status 2025 Qx"
#>  $ mnthbld  : num [1:50] 1141 1128 1128 1127 1127 ...
#>   ..- attr(*, "label")= chr "Date enrolled in months since 1900"
#>  $ timebld  : num [1:50] NA 6 NA 4 5 4 6 NA 5 5 ...
#>   ..- attr(*, "label")= chr "Hour of the day of enrollment"
#>  $ fastbld  : num [1:50] 2 2 2 1 1 1 2 2 1 1 ...
#>   ..- attr(*, "label")= chr "Enrolled in person"
#>  $ prob4bld : logi [1:50] NA NA NA NA NA NA ...
#>   ..- attr(*, "label")= chr "Enrollment problem 4: Tired"
#>  $ prob5bld : num [1:50] NA NA NA NA NA NA NA NA NA NA ...
#>   ..- attr(*, "label")= chr "Enrollment problem 5: Unaccompanied"
#>  $ prob9bld : logi [1:50] NA NA NA NA NA NA ...
#>   ..- attr(*, "label")= chr "Enrollment problem 9: Friday"
#>  $ prob10bld: num [1:50] NA NA NA NA NA NA NA NA NA NA ...
#>   ..- attr(*, "label")= chr "Enrollment problem 10: Left Early"
#>  $ prob18bld: num [1:50] NA NA NA 1 NA NA NA NA NA NA ...
#>   ..- attr(*, "label")= chr "Enrollment problem 18: Not Used"
#>  - attr(*, "spec")=
#>   .. cols(
#>   ..   id = col_double(),
#>   ..   cd = col_double(),
#>   ..   racebld = col_double(),
#>   ..   yobenr = col_double(),
#>   ..   smokebld = col_double(),
#>   ..   mnthbld = col_double(),
#>   ..   timebld = col_double(),
#>   ..   fastbld = col_double(),
#>   ..   prob4bld = col_logical(),
#>   ..   prob5bld = col_double(),
#>   ..   prob9bld = col_logical(),
#>   ..   prob10bld = col_double(),
#>   ..   prob18bld = col_double()
#>   .. )
#>  - attr(*, "problems")=<externalptr>
```
