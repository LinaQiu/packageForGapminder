% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gapminder_lm_table.R
\name{gapminder_lm_table}
\alias{gapminder_lm_table}
\title{Create a table for fitted linear model between variables pop/lifeExp/gdpPercap and year in gapminder dataset}
\usage{
gapminder_lm_table(countryName, x = "year", y = "pop")
}
\arguments{
\item{countryName}{character this should be the name of country that you want to explore in gapminder dataset.}

\item{x}{character default value would be "year" here.}

\item{y}{character this could be one of the three variables(pop/lifeExp/gdpPercap) in gapminder dataset. Default value of y is "pop".}
}
\value{
tbl_df
}
\description{
gapminder_lm_table is used to show how well pop/lifeExp/gdpPercap and year of a specific country in gapminder dataset
fit the linear model. After using linear model to fit the data, it will display the actual pop/lifeExp/gdpPercap value and the corresponding
predicted values which we can compute through the fitted linear model. Besides, it will also show the difference between actual pop/lifeExp/gdpPercap
value and its predicted value.
}
\examples{
gapminder_lm_table("Canada")
gapminder_lm_table("Canada","year","lifeExp")
}

