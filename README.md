
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

Currently launching into the primary function as so:

``` r
library(fixer)

debugonce("read_fwf_dd")

fwiffer:::read_fwf_example("example-fwf-dictionary.dd") |> 
  read_fwf_dd(skip = 2)
```
