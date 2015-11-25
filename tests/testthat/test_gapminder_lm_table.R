context("Create a table for fitted linear model between variables pop/lifeExp/gdpPercap and year in gapminder dataset")

test_that("gapminder_lm_table() returns a tbl_df",{
  test_country <- gapminder_lm_table("Canada")
  expect_is(test_country,"tbl")
})

test_that("Country not found results in error",{
  test_country <- gapminder_lm_table("Lol")
  expect_identical(test_country,"The country name you provided not found in gapminder. Please try an existing country name.")
})

test_that("Empty country name provide results in error",{
  test_country <- gapminder_lm_table("")
  expect_identical(test_country,"Please provide a country name that you would like to explore.")
})

test_that("No parameter passed",{
  expect_error( gapminder_lm_table())
})

test_that("Whether parameter y has a valid value",{
  test_country <- gapminder_lm_table("Canada","year","continent")
  expect_identical(test_country,"Invalid parameter y. You can leave y equal to its default value 'pop' or set it as pop/lifeExp/gdpPercap.")
})
