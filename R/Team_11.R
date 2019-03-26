#' Team 11 Function
#'
#' Function based on team_11 in lab2
#' Converts a shape file into a dataframe.
#'
#' @param file input shape file datsest (.shp)
#' @param tolerance the value for thining the shape file. The tolerance is a single numeric value (e.g., 0.1)
#'
#'
#' @importFrom checkmate expect_class expect_file expect_logical expect_numeric expect_string
#' @importFrom dplyr %>% mutate select
#' @importFrom maptools thinnedSpatialPoly
#' @importFrom methods as
#' @importFrom purrr flatten map_df map_dfr map_depth
#' @importFrom rlang .data
#' @importFrom sf read_sf st_as_sf st_geometry_type
#'
#' @export team_11
# Function to turn a shape file for a country into a dataframe
team_11 <- function(file, tolerance){


    # write condition if the file is shape file
    if (is.character(file)) {

        # Stop if the file can not find
        checkmate::expect_file(file)

        # Read in the shape file
        ozbig <- sf::read_sf(file)

        # Thin the shape file
        oz_st <- maptools::thinnedSpatialPoly(as(ozbig, "Spatial"),
                                                tolerance = tolerance,
                                                minarea = 0.001,
                                                topologyPreserve = TRUE)

        # Change the file to an sf file
        oz <- sf::st_as_sf(oz_st)

    } else if (is.list(file)){

        # Stop the function if the file is a list but is not an sf multipolygon object
        checkmate::expect_class(file[1],
                                classes = "sf",
                                info = "The file must be a multipolygon geometry file by sf")

        oz <- file

    } else {

        # otherwise Stop the function and return the follow message
        stop("The file must be either a .shp file or an sf multipolygon file by sf.")

    }
        map_depth(.x = oz$geometry, 2, .f = c(1)) %>% flatten %>%
            map_dfr(data.frame, .id = "group") -> df
        # rename columns
        colnames(df) <- c("group", "long", "lat")
        # add new variable = "order"
        df$order <- seq(from = 1, to = nrow(df), by = 1)
        return(df)
    }


