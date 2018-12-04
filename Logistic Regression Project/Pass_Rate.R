# View first few entries
head(STAT_GRADES)

#Get summary of dataset
summary(STAT_GRADES)

#Drop rows with missing observations
na.omit(STAT_GRADES)

# Run Logistic Regression
mylogit <- glm(PASS ~ HSGPA + UNITS_ENROLLED + STANDARDIZED_TEST_SCORE + STEM_MAJOR, data = STAT_GRADES, family = "binomial")
summary(mylogit)