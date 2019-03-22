#' The function that allowed to create a data frame from a geometry variable
#'
#'
#'
#'@param file file path is a file path to a shape file
#'@param tolerance is value used for thinning the polygon
#'@return df.oz.purr
#'@import tidyverse
#'@import purrr
#'@import sf
#'@export

#file path for now
path = "./data/gadm36_AUS_shp/gadm36_AUS_1.shp"


team_1 <- function(file,tolerance) {
  ozbig <- read_sf(file)
  oz_st <- maptools::thinnedSpatialPoly(as(ozbig, "Spatial"), tolerance = tolerance, minarea = 0.001, topologyPreserve = TRUE)
  oz <- st_as_sf(oz_st)
  df.oz.purr <- oz$geometry %>%
      map_depth(3, data.frame) %>%
      purrr::flatten() %>%
      purrr::flatten() %>%
      bind_rows(.id = "group") %>%
      rename("lat" = y, "long" = x)
  return(df.oz.purr)
}

