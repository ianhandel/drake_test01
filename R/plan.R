ians_analysis <-
  drake_plan(
    
    cars = read_csv(file_in("data/car_data.csv")),
    
    drive_lookup = read_csv(file_in("data/drive_lookup.csv")),
    
    merged_data = target(left_join(cars, drive_lookup, by = "drv")),
    
    cars_summary = summarise_cars(merged_data),
    
    cars_plot = plot_cars(merged_data),
    
    cars_model = regress_cars(merged_data),
    
    report = rmarkdown::render(
          knitr_in("cars_report.Rmd"),
          output_file = file_out("car_report.html"),
          quiet = TRUE)
  )
