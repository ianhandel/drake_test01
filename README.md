
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drake\_test01

A demo of using [Drake](https://github.com/ropensci/drake) for more
reproducible research.

R directory contains:

1.  packages.R to load packages needed
2.  plan.R to generate a Drake plan
3.  other scripts to create functions used in plan

In the root dirctory make.R will ‘source’ all the R scripts and run the
plan.

To try use:
    `source("make.R")`

    #> ── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
    #> ✓ ggplot2 3.3.0     ✓ purrr   0.3.4
    #> ✓ tibble  3.0.1     ✓ dplyr   0.8.5
    #> ✓ tidyr   1.0.2     ✓ stringr 1.4.0
    #> ✓ readr   1.3.1     ✓ forcats 0.5.0
    #> ── Conflicts ────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    #> x tidyr::expand() masks drake::expand()
    #> x dplyr::filter() masks stats::filter()
    #> x tidyr::gather() masks drake::gather()
    #> x dplyr::lag()    masks stats::lag()
    #> ▶ target cars
    #> Parsed with column specification:
    #> cols(
    #>   manufacturer = col_character(),
    #>   model = col_character(),
    #>   displ = col_double(),
    #>   year = col_double(),
    #>   cyl = col_double(),
    #>   trans = col_character(),
    #>   drv = col_character(),
    #>   cty = col_double(),
    #>   hwy = col_double(),
    #>   fl = col_character(),
    #>   class = col_character()
    #> )
    #> ▶ target drive_lookup
    #> Parsed with column specification:
    #> cols(
    #>   drv = col_character(),
    #>   drive = col_character()
    #> )
    #> ▶ target merged_data
    #> ▶ target cars_plot
    #> ▶ target cars_summary
    #> ▶ target cars_model
    #> ▶ target report

Look at the plan with: `ians_analysis`

    #> # A tibble: 7 x 2
    #>   target      command                                                           
    #>   <chr>       <expr_lst>                                                        
    #> 1 cars        read_csv(file_in("data/car_data.csv"))                           …
    #> 2 drive_look… read_csv(file_in("data/drive_lookup.csv"))                       …
    #> 3 merged_data left_join(cars, drive_lookup, by = "drv")                        …
    #> 4 cars_summa… summarise_cars(merged_data)                                      …
    #> 5 cars_plot   plot_cars(merged_data)                                           …
    #> 6 cars_model  regress_cars(merged_data)                                        …
    #> 7 report      rmarkdown::render(knitr_in("doc/cars_report.Rmd"), output_file = …

Load in the objects that Drake makes with, for example:
`loadd(cars_summary)`

Then it’ll be in your R workspace…

``` r
ls()
#> [1] "cars_summary"   "ians_analysis"  "plot_cars"      "regress_cars"  
#> [5] "summarise_cars"

cars_summary
#> # A tibble: 3 x 3
#>   drive             mean_hwy mean_cty
#>   <chr>                <dbl>    <dbl>
#> 1 4x4                   19.2     14.3
#> 2 Front wheel Drive     28.2     20  
#> 3 Rear wheel Drive      21       14.1
```

Or read it directly e.g.

``` r
print(readd(cars_summary))
#> # A tibble: 3 x 3
#>   drive             mean_hwy mean_cty
#>   <chr>                <dbl>    <dbl>
#> 1 4x4                   19.2     14.3
#> 2 Front wheel Drive     28.2     20  
#> 3 Rear wheel Drive      21       14.1
```

If you change the plan and then run make.R only the targets that depend
on the changes will be re-run\!
