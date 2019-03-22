Lab 3
================
Jing Zhao, Gulzina Kuttubekova, Agadilov Gani, Joshua Budi
3/13/2019

The package stat585lab3package was created for lab3 in STAT 585. This package contains four functions (team\_1,team\_10,team\_11,?) which can convert sf shape files to data frames. These functions are based on lab 2 activity in the stat585.

Here is a link to our GitHub
[Link](https://github.com/kgulzina/stat585lab3package) to the github repo where all code of the package is deposited.

First, load the package.

``` r
library(stat585lab3package)
```

Functions
=========

team\_1
-------

The team\_1 was written by Gani Agadilov. This is the function created by team 1 in lab2 activity.
`input`
file: file path is a file path to a shape file
tolerance: value used for thinning the polygon

``` r
# Aus_t1 <- team_1("./data/gadm36_AUS_shp/gadm36_AUS_1.shp", 0.1)
# head(Aus_t1)
```

team\_10
--------

The team\_10 function was written by Gulzina Kuttubekova. This is the function created by team 10 in lab2 activity.
`input`
file: file path to a shapefile
tolerance: tolerance `Value` geo\_info: dataframe containing geographic and additional information on polygons.

``` r
Aus_t10 <- team_10("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1)
head(Aus_t10)
```

    ## # A tibble: 6 x 5
    ##   name                        region group  long   lat
    ##   <chr>                        <int> <int> <dbl> <dbl>
    ## 1 Ashmore and Cartier Islands      1     1  124. -12.5
    ## 2 Ashmore and Cartier Islands      1     1  124. -12.5
    ## 3 Ashmore and Cartier Islands      1     1  124. -12.5
    ## 4 Ashmore and Cartier Islands      1     1  124. -12.5
    ## 5 Ashmore and Cartier Islands      1     1  124. -12.5
    ## 6 Ashmore and Cartier Islands      1     2  123. -12.3

team\_11
--------

The team\_11 function was written by Jing Zhao. This is the function created by team 11 in lab2 activity.
`input`
file : input shape file datsest (.shp)
tolerance: the value for thining the shape file. The tolerance is a single numeric value (e.g., 0.1)

``` r
# Use the team_11 function to convert the shape file to a dataframe using example data
Aus_t11 <- team_11("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1)
# pring the head of the dataframe
head(Aus_t11)
```

    ##   group     long       lat order
    ## 1     1 123.5556 -12.53057     1
    ## 2     1 123.5554 -12.53213     2
    ## 3     1 123.5524 -12.53137     3
    ## 4     1 123.5536 -12.53039     4
    ## 5     1 123.5556 -12.53057     5
    ## 6     2 123.0178 -12.25917     6

We also creat an example data within the package called (Aus) using the following code.

``` r
#convert shape file to sf file
library(tidyverse)
library(sf)
# Read in the shape file
ozbig <- read_sf("./data/gadm36_AUS_shp/gadm36_AUS_1.shp")
# Thin the file
oz_st <- maptools::thinnedSpatialPoly(as(ozbig, "Spatial"), 
                                      tolerance = 0.1, 
                                      minarea = 0.001, 
                                      topologyPreserve = TRUE)
# Convert it to a sf file
Aus <- st_as_sf(oz_st)
```

The same result yielded using this function.

``` r
Aus_t11_2 <- team_11(Aus, 0.1)
head(Aus_t11_2)
```

    ##   group     long       lat order
    ## 1     1 123.5556 -12.53057     1
    ## 2     1 123.5554 -12.53213     2
    ## 3     1 123.5524 -12.53137     3
    ## 4     1 123.5536 -12.53039     4
    ## 5     1 123.5556 -12.53057     5
    ## 6     2 123.0178 -12.25917     6
