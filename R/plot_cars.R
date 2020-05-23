##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @return
##' @author ianhandel
##' @export
plot_cars <- function(df) {

  ggplot(df) +
    aes(x = displ, y = hwy, colour = drive) +
    geom_point() +
    geom_smooth()

}
