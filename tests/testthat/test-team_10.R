context("test-team_10")
filepath #<- system.file("data/gadm36_AUS_shp/gadm36_AUS_1.shp", ".shp", package = ???)

test_that("takes in correct path", {
    # expect an error due to incorrect path
    expect_error(team_10(c(8, 13), 0.01))

    # expect an error due to incorrect path
    expect_error(team_10("testing", 0.01))
})


test_that("tolerance is correct", {
    # expect error due to tolerance out of range
    expect_error(team_10(file = "./data/gadm36_AUS_shp/gadm36_AUS_1.shp", 13))
    # expect error due to not numeric tolerance
    expect_error(team_10(file = "./data/gadm36_AUS_shp/gadm36_AUS_1.shp", "test"))
})


test_that("output is dataframe", {
    # expect data frame
    filepath <- system.file("gadm36_AUS_shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_s3_class(team_10(filepath, 0.01), "data.frame")
})
