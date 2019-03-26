context("test-team_11")

test_that("output is dataframe", {
    # expect data frame output
     filepath <- system.file("gadm36_AUS.shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_s3_class(team_11(filepath, 0.01), "data.frame")
})

