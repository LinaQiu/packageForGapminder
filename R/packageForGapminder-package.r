#' packageForGapminder: Make it easier to see if there are any linear relationships between pop/lifeExp/gdpPercap VS year for countries in gapminder dataset
#'
#' While you are analysing gapminder dataset, you may want to find out if there are any linear relationship between variables
#' pop/lifeExp/gapPercap and year for each country. Thus you would need to extract relevant data out for a country first, then
#' employ lm() to fit a linear model to the data, and write a bunch lines of code to create a table/plot to show the relationship
#' intuitively. It would be very annoying if you must repeat all codes everytime when you want to check the relationship for a
#' country. Therefore, this package is created to make it easier to model pop/lifeExp/gdpPercap VS year for countries in gapminder
#' dataset, as well as to make it possible to use only one line code to help you get a intuitive view on how well pop/lifeExp/gdpPercap
#' and year in gapminder dataset fits a linear model.
#'
#'
#' @name packageForGapminder
#' @docType package
NULL
