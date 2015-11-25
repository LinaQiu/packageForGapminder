context("Make a plot to show how well pop/lifeExp/gdpPercap and year in gapminder dataset fits a linear model")

test_that("Country not found results in error",{
  test_country <- gapminder_lm_plot("Lol")
  expect_identical(test_country,"The country name you provided not found in gapminder. Please try an existing country name.")
})

test_that("Empty country name provide results in error",{
  test_country <- gapminder_lm_plot("")
  expect_identical(test_country,"Please provide a country name that you would like to explore.")
})

test_that("No parameter passed",{
  expect_error( gapminder_lm_plot())
})

test_that("Whether parameter y has a valid value",{
  test_country <- gapminder_lm_plot("Canada","year","continent")
  expect_identical(test_country,"Invalid parameter y. You can leave y equal to its default value 'pop' or set it as pop/lifeExp/gdpPercap.")
})
