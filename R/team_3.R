#'Team 3 converting shape data file function
#'Function based on team 3 - lab 2 - STAT 585 2019
#'converts map data into a dataframe
#'function put together to the team package by Joshua Budi
#'
#'@param file file path of the map data
#'@param tolerance the unit value for thinning spatial map data (.shp)
#'@import tidyverse
#'@import rgeos
#'@importFrom sf read_sf st_as_sf
#'@importFrom maptools thinnedSpatialPoly
#'@importFrom purrr flatten
#'@importFrom methods as
#'@export team_3

team_3 <- function(file, tolerance) {
    # check is path is character
    if (is.character(file)) {
        # check if file path exists
        check_file_exists(x = file)
    } else {
        stop("Error: invalid file path")
    }

    con_big <- read_sf(file)
    con_st <- maptools::thinnedSpatialPoly(
        as(con_big, "Spatial"), tolerance = tolerance,
        minarea = 0.001, topologyPreserve = TRUE)
    con <- st_as_sf(con_st)
    con_plus <- con$geometry %>%
        flatten() %>%
        flatten() %>%
        lapply(., as.data.frame) %>%
        bind_rows() %>%
        rename(., c("x" ="long", "y" = "lat"))
    temp <- con$geometry %>%
        flatten() %>%
        flatten() %>%
        lapply(., nrow) %>%
        unlist
    con_plus$group <- rep(1 : length(temp), temp)
    con_plus %>%
        ggplot(aes(x = long, y = lat, group = group)) +
        geom_polygon()
}
