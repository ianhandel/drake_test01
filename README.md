
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drake\_test01

A demo of using Drakw for more reproducible research.

R directory contains:

1.  packages.R to load packages needed
2.  plan.R to generate a Drake plan
3.  other scripts to create functions used in plan

In the root dirctory make.R will ‘source’ all the R scripts and run the
plan.

To try use: `source("make.R")`

Look at the plan with: `ians_analysis`

Load in the objects that Drake makes with, for exanmple:
`loadd(cars_summary)`

Then it’ll be in your R workspace.

Or read it directly e.g. `print(readd(cars_summary))`
