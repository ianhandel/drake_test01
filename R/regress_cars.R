##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @return
##' @author ianhandel
##' @export
regress_cars <- function(df) {

  mod <- lm(hwy ~ displ, data = df)
  
  tidy(mod)

}
