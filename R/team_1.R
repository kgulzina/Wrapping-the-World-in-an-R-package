#' The function that allowed to create a data frame from a geometry variable
#'
#'
#'@author Gani Agadilov
#'@param file is a file path to a shape file
#'@param tolerance is value used for thinning the polygon
#'@return df.oz.purr
#'@importFrom maptools thinnedSpatialPoly
#'@importFrom methods as
#'@importFrom purrr flatten map_depth
#'@importFrom rlang .data
#'@importFrom sf read_sf st_as_sf
#'@importFrom dplyr %>% bind_rows rename
#'@export team_1




team_1 <- function(file,tolerance) {
  ozbig <- read_sf(file)
  oz_st <- maptools::thinnedSpatialPoly(as(ozbig, "Spatial"), tolerance = tolerance, minarea = 0.001, topologyPreserve = TRUE)
  oz <- st_as_sf(oz_st)
  df.oz.purr <- oz$geometry %>%
      map_depth(3, data.frame) %>%
      purrr::flatten() %>%
      purrr::flatten() %>%
      bind_rows(.id = "group") %>%
      rename("lat" = .data$y, "long" = .data$x)
  return(df.oz.purr)
}

