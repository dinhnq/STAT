x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)
plot(x = x, y = y, xlab = "X", ylab = "Y")

#abline(lm(y - x), col="red")

#install.packages("ggplot2")
#library("ggplot2")
tut.data <- data.frame(x, y)
tut.lm <- lm(y ~ x, data = tut.data)
abline(tut.lm)
