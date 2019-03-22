
#' The function that allowed to create a data frame from a geometry variable
#'
#'
#'
#'@param file file path is a file path to a shape file
#'@param tolerance is value used for thinning the polygon
#'
#' @importFrom checkmate expect_class expect_file expect_logical expect_numeric expect_string
#' @importFrom maptools thinnedSpatialPoly
#' @importFrom dplyr select group_by mutate as_tibble %>% bind_rows rename
#' @importFrom tidyr unnest
#' @importFrom methods as
#' @importFrom purrr flatten map map_depth
#' @importFrom sf read_sf st_as_sf st_geometry_type
#' @importFrom rlang .data
#' @export team_1
#'
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
