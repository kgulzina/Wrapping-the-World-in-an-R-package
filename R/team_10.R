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
#' @importFrom checkmate expect_class expect_file expect_logical expect_numeric expect_string
#' @importFrom maptools thinnedSpatialPoly
#' @importFrom dplyr select group_by mutate as_tibble %>%
#' @importFrom tidyr unnest
#' @importFrom methods as
#' @importFrom purrr flatten
#' @importFrom sf read_sf st_as_sf st_geometry_type
#' @export team_10

team_10 <- function(file, tolerance) {
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

    # return a dataframe with geographic and additional information
    return(geo_info)
}
