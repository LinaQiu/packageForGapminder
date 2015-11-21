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
