##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##'
##' @title
##' @param df
##' @return
##' @author ianhandel
##' @export
summarise_cars <- function(df) {

  df %>% 
    group_by(drive) %>% 
    summarise(mean_hwy = mean(hwy),
              mean_cty = mean(cty)) %>% 
    mutate_if(is_bare_double, round, 1)

}
