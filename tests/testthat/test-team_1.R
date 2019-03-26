context("test-team_1")

test_that("team_1 fucnction provides a dataframe", {
    filepath <- system.file("gadm36_AUS_shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_s3_class(team_1(filepath, 0.1), "data.frame")
    })

test_that("team_1 fucnction has correct names of the columns", {
    filepath <- system.file("gadm36_AUS_shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_named(team_1(filepath,0.1), c("group", "long", "lat" ))
})
