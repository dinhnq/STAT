# Ref: 2.16 Rat Speed Example

# Create vectors in which to store the data.
test.score <- c(44, 46, 59, 48, 49, 60, 51, 39,
                43, 45, 57, 51, 51, 49, 44, 61,
                51, 34, 53, 45, 41, 46, 41, 43,
                52, 47, 59, 56, 49, 61, 57, 54);

personality.type <- rep(1:4, each = 8);

# Carry out Levene's test
# library(car);
# leveneTest(test.score ~ factor(personality.type), center = "mean");

# Produce a boxplot of the test's score by the personality types
boxplot(test.score ~ personality.type,
        main = "Distribution of Test Score",
        xlab = "Personality Type", ylab = "Test Score (point)");

# Diagnostic graphs
# Scatterplot of residuals vs. fitted values
# plot(x = person.ANOVA$fitted.values, y = person.ANOVA$residuals,
#      xlab = "Predicted values", ylab = "Residuals");
# abline(h = 0, lty = 2);

# Normal Q-Q plot of residuals
# qqnorm(person.ANOVA$residuals);
# qqline(person.ANOVA$residuals);

# Carry out a one-way ANOVA of the test's score on the personality types
# person.ANOVA <- aov(test.score ~ factor(personality.type));
# summary(person.ANOVA);

# Analyse the data in R using the model from part (a), but try both the untransformed response variable and the log-transformed response variable.

# Store the response (number of plant weights) and factors 
# (plant name, pH) in vectors
# weights <- c( 6340, 4280, 5170, 2880, 4330, 3050,
#                3690, 4750, 5100, 2360, 1990, 2140,
#                250, 470, 330, 400, 310, 430,
#                2850, 2380, 3130, 1070, 960, 1300);
# plant.name <- rep(
#   c("Alpine pennycress", "Bladder campion", "Lettuce", "Martin red fescue"), each = 6);
# pH.scale <- rep(rep(c("pH 5.5 (acid)", "pH 7 (neutral)"), each = 3), times = 4);
# 
# cbind(weights, plant.name, pH.scale);
# 
# # The UNTRANSFORMED RESPONSE VARIATION
# # Fit a two-way ANOVA to the plant weights data.
# plant.weights.ANOVA <- aov( weights ~ factor(pH.scale)*factor(plant.name) );
# # Scatterplot of residuals vs. fitted values for plant weights data.
# plot(x = plant.weights.ANOVA$fitted.values, y = plant.weights.ANOVA$residuals,
#      main = "Residuals vs. fitted values \n ANOVA for plant weights data", 
#      xlab = "Predicted values", ylab = "Residuals");
# abline(h = 0, lty = 2);
# 
# # Normal Q-Q plot of residuals for plant weights data
# qqnorm(
#   plant.weights.ANOVA$residuals,
#   main = "Normal Q-Q plot of residuals \n ANOVA for plant weights data")
# qqline(plant.weights.ANOVA$residuals);
# 
# # The TRANSFORMED RESPONSE VARIATION
# # Fit a two-way ANOVA to the plant weights data.
# plant.logweights.ANOVA <- aov( log(weights) ~ factor(pH.scale)*factor(plant.name) );
# # Scatterplot of residuals vs. fitted values for plant weights data.
# plot(x = plant.logweights.ANOVA$fitted.values, y = plant.logweights.ANOVA$residuals,
#      main = "Residuals vs. fitted values \n ANOVA for plant weights data",
#      xlab = "Predicted values", ylab = "Residuals");
# abline(h = 0, lty = 2);
# 
# # Normal Q-Q plot of residuals for plant weights data
# qqnorm(
#   plant.logweights.ANOVA$residuals, 
#   main = "Normal Q-Q plot of residuals \n ANOVA for plant weights data")
# qqline(plant.logweights.ANOVA$residuals);
# 
# # Produce the two-way ANOVA table for the log-transformed plant weights data
# summary(plant.logweights.ANOVA);
# 
# # Interaction graph for plant logged weights data
# interaction.plot(x.factor = pH.scale, trace.factor = plant.name,
#                  response = log(weights), fun = mean,
#                  xlab = "pH", ylab = "Mean number of log(weights)", 
#                  main = "Interaction graph for plant logged weights data",
#                  legend = TRUE, xpd = TRUE, trace.label = "Name");
# 
# # Question 3 - ref: Gecko example
# 
# # Store the response (mark) and factors (ethnic, gender) in vectors.
# mark <- c( 67, 66, 75, 76, 71, 70, 72, NA, NA, 63, 72, 62, 61, 69, 64, 71, 68, 56,
#             69, 57, 55, 63, 65, 55, NA, NA, NA, 59, 47, 49, NA, NA, NA, NA, NA, NA, 
#             30, 47, NA, NA, NA, NA, NA, NA, NA, 39, 33, NA, NA, NA, NA, NA, NA, NA);
# ethnic <- rep(c(1 : 3), each = 18);
# gender <- rep(rep(c(1 : 2), each = 9), times = 3);
# cbind(marks, ethnic, gender);
# 
# # Fit a two-way ANOVA to the English mark data (Type I SS)
# english.mark.ANOVA <- aov(mark ~ factor(ethnic) * factor(gender));
# summary(english.mark.ANOVA);
# 
# interaction.plot(x.factor = gender, trace.factor = ethnic,
#                  response = mark, fun = mean,
#                  xlab = "Gender", ylab = "Ethnic",
#                  main = "Interaction graph for English mark data",
#                  legend = TRUE, xpd = TRUE, trace.label = "Ethnic Group");

# Now, convert "ethnic" and "gender" to factors
# ethnic <- as.factor(ethnic);
# gender <- as.factor(gender);

# Load the "MASS" add-on package

# library(car);
# Fit a two-way ANOVA to the English mark data (Type III SS)
# Anova(lm(mark ~ ethnic * gender,
#          contrasts = list(ethnic = "contr.sum", gender = "contr.sum")),
#       type = "III");

# Simple linear regression

# Read in data from a CSV file and view species
# species <- read.csv(
#   file = "~/OneDrive - Victoria University of Wellington - STUDENT/Bcom/species.csv");
# head(species);

# Fit a linear regression of species on area
# species.lm <- lm(Species ~ Area, data = species);
# summary(species.lm);

# Produce a scatterplot of species versus area 
# plot(x = species$Area, y = species$Species,
#      main = "Scatterplot of mussel species with Fitted Regression Line",
#      xlab = "Area (dm2)", ylab = "Species");
# abline(species.lm);

# For advanced graphics
# library(ggplot2);
# ggplot(species, aes(x = Area, y = Species)) + 
#   geom_point() + 
#   geom_smooth(method = lm) +
#   labs(title = "Scatterplot of mussel species", 
#        subtitle = "with fitted regression line and 95% confidence limits", 
#        x = "Area (dm2)", y = "Species");

# With log(Area)
# Produce a scatterplot of species versus log(area) 
# plot(x = log(species$Area, base = 2), y = species$Species,
#      main = "Scatterplot of mussel species with Fitted Regression Line",
#      xlab = "Area (dm2)", ylab = "Species");
# abline(species.lm);

# For advanced graphics with log(area) as a explanatory variable
# library(ggplot2);
# ggplot(species, aes(x = log(Area), y = Species)) +
#   geom_point() +
#   geom_smooth(method = lm) +
#   labs(title = "Scatterplot of mussel species",
#        subtitle = "with fitted regression line and 95% confidence limits",
#        x = "log(Area) (dm2)", y = "Species");

# ANCOVA Theory
# Carrot example: confirmatory analysis
# Store data in vectors
# fertilizer <- rep(c("Control", "Growmost", "Superior"), each = 10);
# initial <- c(42, 43, 45, 47, 50, 52, 54, 56, 58, 63,
#              40, 43, 43, 45, 48, 51, 52, 57, 59, 65,
#              42, 44, 46, 52, 52, 57, 59, 63, 68, 69);
# increase <- c(1.1, 0.5, 0.9, 0.3, 1.1, 0.6, 1.4, 0.5, 0.6, 0.8,
#               6.2, 8.7, 5.6, 7, 4.5, 3.2, 4.8, 2.2, 1.3, 2,
#               7.1, 9.3, 8.2, 8.9, 7.7, 7.2, 7, 5.5, 3.2, 3.9);

# Produce a scatterplot of increase in yield vs. initial yield
# plot(x = initial, y = increase, xlab = "Initial yield", ylab = "Increase in yield",
#      col = as.numeric(factor(fertilizer)), pch = c(rep(16, times = 10), rep(15, times = 10), rep(17, times = 10)));
# legend("topright", legend = unique(fertilizer), col = unique(as.numeric(factor(fertilizer))), pch = c(16, 15, 17));

# Output for the non-parallel lines model
# Fit an ANCOVA of increase in yield regressed on initial yield and fertilizer, with interaction
# carrot.lm <- lm(increase ~ initial * factor(fertilizer));
# anova(carrot.lm);

# summary(carrot.lm);

# Produce a scatterplot of studentized residuals vs. fitted values
# plot(x = carrot.lm$fitted.values, y = rstudent(carrot.lm),
#      xlab = "Predicted value", ylab = "Studentized residual");
# abline(h = 0);
# abline(h = c(-2, 2), lty = 2);

# Produce a normal Q-Q plot of residuals
# qqnorm(carrot.lm$residuals);
# qqline(carrot.lm$residuals);

# Produce a barplot of Cook's distances

# install.packages("olsrr");
# library(olsrr);
# ols_plot_cooksd_chart(carrot.lm);

# Test 2
# club <- rep(c("A","B","C","D"), each = 10)
# times <- c(52.59, 55.55, 57.17, 50.31, 55.86, 56.01, 53.85, 53.91, 53.87, 53.22,
#            55.05, 54.00, 54.45, 56.13, 57.92, 55.78, 54.98, 54.18, 54.33, 60.83,
#            54.27, 53.02, 53.12, 54.92, 52.61, 51.10, 55.15, 51.95, 53.97, 52.13,
#            60.20, 57.05, 56.58, 57.00, 54.74, 55.66, 53.64, 55.32, 57.41, 57.07)
# tapply(times, club, mean);

# mean(times);

# Produce a boxplot of the test's score by the personality types
# boxplot(times ~ club,
#         main = "Distribution of Display Times by Club",
#         xlab = "Times", ylab = "Club");

# Carry out a one-way ANOVA of the test's score on the personality types
# times.ANOVA <- aov(times ~ factor(club));
# summary(times.ANOVA);

# Carry out Levene's test
# library(car);
# leveneTest(times ~ factor(club), center = "mean");

# Carry out a Tukey test for the rimu data, 
# TukeyHSD(times.ANOVA)



