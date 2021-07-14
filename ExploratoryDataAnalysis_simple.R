# https://blog.datascienceheroes.com/exploratory-data-analysis-in-r-intro/
# install.packages("tidyverse")
# install.packages("funModeling")
# install.packages("Hmisc")

library(funModeling)
library(tidyverse)
library(Hmisc)

# creating data for this example
data = heart_disease %>% select(age, max_heart_rate, thal, has_heart_disease)

# Step 1 - First approach to data
# No. of observations (rows) and variaables
glimpse(data)

# metrics about data types, zeros, infinite numbers, and missing values
# easy to keep with vars that match certain conditions:
# 1. having at least 80% of non-NA values (p_na <0.2)
# 2. having less than 50 unique values (unique <= 50)
status(data)

# Step 2 - Analyzing categorical variables
# run for type = factor from status(data)
freq(data)

# Step 3 - Analyzing numerical vars
# Export the plot to jpeg: plot_num(data, path_out = ".")
# Tips:
# 1. try to identify high-unbalanced vars
# 2. visually check any variable with outliers

# graphically
plot_num(data)

# quantitatively
data_prof = profiling_num(data)

# Step 4 - Analyzing numerical and categorial at the same time
# really useful to have a quick picture for all vars. 
# But is not as operative as freq and profiling_num when we want to 
# use its results to change our data workflow
# Tips
# 1. check min and max values (outliers)
# 2. check distributions (same as before)
describe(data)

# Another solution: run all the functions in one-shot
basic_eda <- function(data)
{
  glimpse(data)
  print(status(data))
  freq(data)
  print(profiling_num(data))
  plot_num(data)
  describe(data)
}
basic_eda(data)
