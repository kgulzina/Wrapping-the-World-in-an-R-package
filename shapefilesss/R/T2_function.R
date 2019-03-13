##team2_function
helper.group <- function(geo){
  geo %>% flatten() %>% flatten()-> dd
  countgrouprep <- flatten_int(map(dd, nrow))
  num_group <- length(countgrouprep)
  rep(1:num_group, time = countgrouprep)
}
## Help calculate the order.
## Input: oz$geometry[[i]]
helper.order <- function(geol){
  geol %>% flatten() -> d
  longlat <- do.call(rbind, d)
  order_num <- sum(flatten_int(map(d, nrow)))
  order <- seq(1:order_num)
  cbind(longlat, order)
}