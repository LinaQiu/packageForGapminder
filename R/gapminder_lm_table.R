#' @title Create a table for fitted linear model between variables pop/lifeExp/gdpPercap and year in gapminder dataset
#'
#' @description gapminder_lm_table is used to show how well pop/lifeExp/gdpPercap and year of a specific country in gapminder dataset
#' fit the linear model. After using linear model to fit the data, it will display the actual pop/lifeExp/gdpPercap value and the corresponding
#' predicted values which we can compute through the fitted linear model. Besides, it will also show the difference between actual pop/lifeExp/gdpPercap
#' value and its predicted value.
#'
#' @param countryName character this should be the name of country that you want to explore in gapminder dataset.
#' @param x character default value would be "year" here.
#' @param y character this could be one of the three variables(pop/lifeExp/gdpPercap) in gapminder dataset. Default value of y is "pop".
#'
#' @return tbl_df
#' @export
#' @examples
#' gapminder_lm_table("Canada")
#' gapminder_lm_table("Canada","year","lifeExp")
#' @importFrom dplyr tbl_df

gapminder_lm_table <- function(countryName,x="year",y="pop")
{
  if(countryName == ""){
    return("Please provide a country name that you would like to explore.")
  }

  ##Get names for all countries in gapminder dataset, which are pre-stored at a file named "countryNames"
  countryNames <- (gapminder %>% arrange(year) %>% head(142))$country    ##because we know there are 142 countries in gapminder dataset in total
  countryNames <- as.character(countryNames)

  if(!(countryName %in% countryNames)){
    return("The country name you provided not found in gapminder. Please try an existing country name.")
  }

  if(!(y %in% c("pop","lifeExp","gdpPercap"))){
    return("Invalid parameter y. You can leave y equal to its default value 'pop' or set it as pop/lifeExp/gdpPercap.")
  }
  countryData <- gapminder %>% filter(country==countryName)

  fit <- lm(countryData[[y]]~countryData[[x]],countryData)

  a=coef(fit)[2];
  b=coef(fit)[1];
  predictDATA <-  data.frame(x=countryData[[x]],predicted_y=a*countryData[[x]]+b)
  predictDATA1 <-  predictDATA %>% mutate(actual_y=countryData[[y]],D_value=(actual_y-predicted_y))
  tbl_df(predictDATA1)
}
