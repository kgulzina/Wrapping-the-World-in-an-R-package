#' team_10
#' Reads in a shapefile of any country, sets a tolerance,
#' and returns a dataframe with information on longitude, lattitude,
#' group, id, and other specific information.
#'
#' @author Gulzina Kuttubekova
#' @param file file path to a shapefile
#' @param tolerance tolerance
#' @return geo_info: dataframe containing geographic and additional
#' information on polygons
#' @import tidyverse
#' @import dplyr
#' @import purrr
#' @import sf
#' @import maptools
#' @import methods
#' @export team_10

team_10 <- function(file, tolerance) {
    # check if file path exists
    check_file_exists(x = file)
    # check if tolerance is numeric and within a [0,1] range
    check_numeric(tolerance, lower = 0, upper = 1)

    shpbig <- read_sf(file)
    shp_st <- maptools::thinnedSpatialPoly(
        as(shpbig, "Spatial"), tolerance = tolerance,
        minarea = 0.001, topologyPreserve = TRUE)
    shp <- st_as_sf(shp_st)
    geo_info <- shp %>% select(NAME_1, geometry) %>%
        group_by() %>%
        mutate(coord = geometry %>% map(.f = function(m) flatten(.x=m)),
               region = row_number()) %>%
        unnest
    st_geometry(geo_info) <- NULL
    geo_info <- geo_info %>%
        mutate(coord = coord %>% map(.f = function(m) as_tibble(m)),
               group = row_number()) %>%
        unnest %>%
        setNames(c("name", "region","group", "long", "lat"))
    # check if geo_info is data frame
    checkDataFrame(geo_info)

    return(geo_info)
}
