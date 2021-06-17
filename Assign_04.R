# Q1.a
# X: female crab
# p(X): probability of the crab having satelites
# Store uniquue female horseshoe crabs (FHC) midpoint values
FHC <- c(22.69, 23.84, 24.77, 25.84, 26.79, 27.74, 28.67, 30.41);

# Store numbers of female peple with and without satelites for each FHC range.
# These represent binomial counts for "success" and "failture" for each FHC range
FCS <- c(5, 4, 17, 21, 15, 20, 15, 14);
FCnoS <- c(9, 10, 11, 18, 7, 4, 3, 0);

# Fit a logistic model of incidence of female crab of satelites on FHC
FCS.model <- glm(cbind(FCS, FCnoS) ~ FHC, family = "binomial");
# summary(FCS.model);

# Logistic regression Odds Ratio
# interpret the "effect" of beta_1 using an odds ratio
# exp(FCS.model$coefficients);

# produce a 95% confidence interval for the odds ratio
# exp(confint.default(FCS.model, parm = "FHC"));

# Values of the explanatory variable used in fitting the logistic regression
FCS.model$fitted.values;

# user-specified values of the explanatory variable: 26cm
predict(FCS.model, newdata = data.frame(FHC = c(22.69, 26)), type = "response");

# deviance and residual degrees of freedom
# G.2 <- FHC.model$deviance;
# residual.df <- FHC.model$df.residual;

# goodness-of-fit p-value
# p.value <- pchisq(q = G.2, df = residual.df, lower.tail = FALSE);
# c(G.2, residual.df, p.value);

# Q2.a
# school <- c(1, 1, 2, 2, 3, 3);
# age <- rep(c("13-15", "16-18"), 3);
# chat <- c(43, 26, 29, 22, 21, 12);
# nochat <- c(134, 149, 23, 36, 131, 152);

# Logit model of chat onlin on school and age group
# saturated.logit.model <- glm(cbind(chat, nochat) ~ factor(school)*factor(age), family = "binomial");
# summary(saturated.logit.model);

# Deviance and residual degrees of freedom
# G.2 <- saturated.logit.model$deviance;
# residual.df <- saturated.logit.model$df.residual;

# Goodness-of-fit p-value
# p.value <- pchisq(q = G.2, df = residual.df, lower.tail = FALSE);

# c(G.2, residual.df, p.value);

# logit.model <- glm(cbind(chat, nochat) ~ factor(school) + factor(age), family = "binomial");
# summary(logit.model);

# Fit two logit models where the reduced model is nested in the full model
# M1 <- glm(cbind(chat, nochat) ~ factor(school) + factor(age), family = "binomial");
# M2 <- glm(cbind(chat, nochat) ~ factor(school) + factor(age) + factor(school)*factor(age), family = "binomial");

# Carry out a model comparison 
# anova(M1, M2, test = "Chisq");

# Interpret the "effect" of beta_1, beta_2 and beta_1_2
# exp(M1$coefficients);

# Produce a 95% confidence interval for the odds ratio
# exp(confint.default(M1, parm = c("factor(school)2", "factor(school)3", "factor(age)16-18")))




