source("R/packages.R")
source("R/plot_cars.R")
source("R/summarise_cars.R")
source("R/regress_cars.R")

source("R/plan.R")

make(ians_analysis,lock_envir = FALSE) #gt package needs this as modifies global .env
