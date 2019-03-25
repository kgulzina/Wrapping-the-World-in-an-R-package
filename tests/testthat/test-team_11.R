context("test-team_11")

# test result:  Test failed: 'read correct path in'
#`team_11("./data/gadm36_AUS_shp/gadm36_AUS_1.shp", 0.1)` did not throw an error.
test_that("read correct path in", {
    expect_error(team_11("./data/gadm36_AUS_shp/gadm36_AUS_1.shp", 0.1))
})

# test result: test sucessfull: there is no message (from checkmate package)
test_that("read correct path in", {
    expect_error(team_11("testforfun", 0.1))
})
# Test failed: 'test whether output is dataframe'
#`team_11("./data/gadm36_AUS_shp/gadm36_AUS_1.shp", 0.1)` did not throw an error.
test_that("test whether output is dataframe", {
    expect_error(team_11("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1), "data.frame")
})


