#' @title Model Population VS Year for countries in GAPMINDER dataset.
#'
#' @description gapminder_lmfit is used to fit linear models to population and time for countries in GAPMINDER dataset.
#' It can be used to carry out regression between population and time, and return the coefficients, residuals
#' and fitError(=sum of residuals^2) back at the same time.
#'
#' @param data a data frame, containing the variables "population" and "year" for a country in GAPMINDER dataset.
#' @param offset this can be used to specify an a priori known component to be included in the linear predictor
#' during fitting. In this function, the default value of offset is 1952, because we want to make the intersect
#' of fitted linear model be the predicted value for year 1952, the year when GAPMINDER dataset began to record
#' data.
#'
#' @return list
#' @export
#' @examples
#' canadaData <- gapminder %>% filter(country=="Canada") %>% arrange(year) %>% select(year,pop)
#' gapminder_lmfit(canadaData)
#'
gapminder_lmfit <- function(data,offset=1952)
{
  results <- vector("list",4)
  lmfit <- lm(pop~I(year-offset),data)
  intersect <- setNames(coef(lmfit)[1],"intersect")
  slope <- setNames(coef(lmfit)[2],"slope")
  res <- lmfit$residuals
  fitError <- setNames(sum(res^2),"fitError(sumOFres^2)")
  res <- setNames(res,c("residuals",c(2:length(res))))

  results[[1]] <- intersect
  results[[2]] <- slope
  results[[3]] <- fitError
  results[[4]] <- res

  return(results)
}
