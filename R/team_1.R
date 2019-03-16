
library(tidyverse)
library(purrr)
library(sf)

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

# The retun value is the dataframe

result <- team_1(file="data/gadm36_AUS_shp/gadm36_AUS_1.shp", tolerance=0.1)
