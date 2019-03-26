context("test-team_1.R")

<<<<<<< HEAD

# Test provides a dataframe
test_that("team_1 fucnction provides a dataframe", {
    filepath <- system.file("gadm36_AUS_shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_s3_class(team_1(filepath, 0.1), "data.frame")
    })


# Test provides the names of the columns of the dataframe
test_that("team_1 fucnction has correct names of the columns", {
    filepath <- system.file("gadm36_AUS_shp/gadm36_AUS_1.shp", package ="stat585lab3package")
    expect_named(team_1(filepath,0.1), c("group", "long", "lat" ))
})



# Test  checks for the correct path
test_that("team_1 fucnction has incorrect path", {
    expect_error(team_1("shapefile",0.1))
})
=======
test_that("team_1 fucnction works properly", {
    expect_s3_class(team_1("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1), "data.frame")
    expect_named(team_1("./data/gadm36_AUS_shp/gadm36_AUS_1.shp",0.1), c("group", "long", "lat" ))
    })

>>>>>>> 636496925339e675b445b65e39e518ac11fec703
