#' @title Draw a plot to show how well pop/lifeExp/gdpPercap and year in gapminder dataset fits a linear model
#'
#' @description gapminder_lm_plot is used to show how well pop/lifeExp/gdpPercap and year of a specific country in gapminder dataset
#' fit the linear model. After using linear model to fit the data, it will display how actual value of pop/lifeExp/gdpPercap changes
#' with year, as well as how predicted value of pop/lifeExp/gdpPercap changes with year.
#'
#' @param countryName character this should be the name of country that you want to explore in gapminder dataset.
#' @param x character default value would be "year" here.
#' @param y character this could be one of the three variables(pop/lifeExp/gdpPercap) in gapminder dataset. Default value of y is "pop".
#'
#' @export
#' @examples
#' gapminder_lm_plot("Canada")
#' gapminder_lm_plot("Canada","year","lifeExp")
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes_string
#' @importFrom ggplot2 geom_abline
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 scale_x_continuous

gapminder_lm_plot <- function(countryName,x="year",y="pop")
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

  ggplot(countryData)+
    aes_string(x=x,y=y) +
    geom_abline(intercept =b,slope = a,color = "red",alpha=1) +
    geom_point(data=predictDATA, aes(x=x,y=predicted_y), color="red", size=3, shape=1) +
    geom_line() +
    geom_point(size=3) +
    geom_line(alpha=0.6) +
    scale_x_continuous(breaks = countryData[[x]])
}
