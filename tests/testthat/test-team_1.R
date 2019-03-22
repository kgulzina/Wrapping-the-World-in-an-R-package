context("test-team_1.R")

test_that("team_1 fucnction works properly", {
    expect_s3_class(team_1("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1), "data.frame")
    expect_named(team_1("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1), c("group", "long", "lat" ))
    })
purr
