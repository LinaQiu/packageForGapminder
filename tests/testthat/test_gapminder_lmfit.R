context("Model Population VS Year for countries in gapminder dataset.")

library(gapminder)

test_that("gapminder_lmfit() returns a list",{
  test_country <- gapminder_lmfit("Canada")
  expect_is(test_country,"list")
})

test_that("Country not found results in error",{
  test_country <- gapminder_lmfit("Lol")
  expect_identical(test_country,"The country name you provided not found in gapminder. Please try an existing country name...")
})

test_that("Empty country name provide results in error",{
  test_country <- gapminder_lmfit("")
  expect_identical(test_country,"Please provide a country name that you would like to explore.")
})

test_that("No parameter passed",{
  expect_error( gapminder_lmfit())
})
