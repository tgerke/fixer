
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

## Read a fixed width file according to its data dictionary

``` r
library(fixer)

dd <- fwiffer:::read_fwf_example("example-fwf-dictionary.dd") |> 
  read_dd(skip = 2)

fwf_data <- fixer:::read_fwf_example("example-fwf-data.dat") |>
  read_fwf_dd(dd)

fwf_data
#> # A tibble: 450 × 13
#>        id    cd racebld yobenr smokebld mnthbld timebld fastbld       prob4bld
#>     <dbl> <dbl> <fct>    <dbl> <fct>      <dbl> <fct>   <fct>         <lgl>   
#>  1 538197    70 White       21 Never       1141 <NA>    No or missing NA      
#>  2 538199    76 White       22 Past        1128 12:00 p No or missing NA      
#>  3 538202    17 White       22 Past        1128 <NA>    No or missing NA      
#>  4 538205    26 White       22 Past        1127 8:00 a  Yes           NA      
#>  5 538307    32 White       22 Past        1127 10:00 a Yes           NA      
#>  6 538227    44 White       21 Past        1129 8:00 a  Yes           NA      
#>  7 538236    44 White       22 Never       1129 12:00 p No or missing NA      
#>  8 538254    42 White       23 Past        1130 <NA>    No or missing NA      
#>  9 538259    63 White       24 Never       1135 10:00 a Yes           NA      
#> 10 538263    54 White       25 Past        1129 10:00 a Yes           NA      
#> # ℹ 440 more rows
#> # ℹ 4 more variables: prob5bld <fct>, prob9bld <lgl>, prob10bld <fct>,
#> #   prob18bld <fct>
```

Note that variable labels are retained as well:

``` r
library(gtsummary)

fwf_data %>%
  select(racebld, smokebld, fastbld) %>%
  tbl_summary()
```

<div id="iyjzeocasv" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#iyjzeocasv table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#iyjzeocasv thead, #iyjzeocasv tbody, #iyjzeocasv tfoot, #iyjzeocasv tr, #iyjzeocasv td, #iyjzeocasv th {
  border-style: none;
}
&#10;#iyjzeocasv p {
  margin: 0;
  padding: 0;
}
&#10;#iyjzeocasv .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#iyjzeocasv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#iyjzeocasv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#iyjzeocasv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#iyjzeocasv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#iyjzeocasv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#iyjzeocasv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#iyjzeocasv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#iyjzeocasv .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#iyjzeocasv .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#iyjzeocasv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#iyjzeocasv .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#iyjzeocasv .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#iyjzeocasv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#iyjzeocasv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iyjzeocasv .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#iyjzeocasv .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#iyjzeocasv .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#iyjzeocasv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iyjzeocasv .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#iyjzeocasv .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iyjzeocasv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#iyjzeocasv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iyjzeocasv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iyjzeocasv .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iyjzeocasv .gt_left {
  text-align: left;
}
&#10;#iyjzeocasv .gt_center {
  text-align: center;
}
&#10;#iyjzeocasv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#iyjzeocasv .gt_font_normal {
  font-weight: normal;
}
&#10;#iyjzeocasv .gt_font_bold {
  font-weight: bold;
}
&#10;#iyjzeocasv .gt_font_italic {
  font-style: italic;
}
&#10;#iyjzeocasv .gt_super {
  font-size: 65%;
}
&#10;#iyjzeocasv .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#iyjzeocasv .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#iyjzeocasv .gt_indent_1 {
  text-indent: 5px;
}
&#10;#iyjzeocasv .gt_indent_2 {
  text-indent: 10px;
}
&#10;#iyjzeocasv .gt_indent_3 {
  text-indent: 15px;
}
&#10;#iyjzeocasv .gt_indent_4 {
  text-indent: 20px;
}
&#10;#iyjzeocasv .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;N = 450&lt;/strong&gt;&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;"><strong>N = 450</strong><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left">Ancestry</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    White</td>
<td headers="stat_0" class="gt_row gt_center">405 (90%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    European</td>
<td headers="stat_0" class="gt_row gt_center">0 (0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Asian</td>
<td headers="stat_0" class="gt_row gt_center">9 (2.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Other race</td>
<td headers="stat_0" class="gt_row gt_center">36 (8.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Smoking Status 2025 Qx</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Never</td>
<td headers="stat_0" class="gt_row gt_center">216 (48%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Past</td>
<td headers="stat_0" class="gt_row gt_center">189 (42%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    No, unknown past history</td>
<td headers="stat_0" class="gt_row gt_center">27 (6.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Current</td>
<td headers="stat_0" class="gt_row gt_center">18 (4.0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Passthru</td>
<td headers="stat_0" class="gt_row gt_center">0 (0%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">Enrolled in person</td>
<td headers="stat_0" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left">    Yes</td>
<td headers="stat_0" class="gt_row gt_center">252 (56%)</td></tr>
    <tr><td headers="label" class="gt_row gt_left">    No or missing</td>
<td headers="stat_0" class="gt_row gt_center">198 (44%)</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> n (%)</td>
    </tr>
  </tfoot>
</table>
</div>
