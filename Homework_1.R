# Read in Dataset
LungCapData <- read.csv("~/Documents/School/CSULB/CSULB - M.A.S./STAT 510 - Regression/HW_1/LungCapData.csv")

# Number of Observations
nrow(LungCapData)

# Print Variable Names
names(LungCapData)

# Run linear model regression, declare variables
mod<-lm(LungCapData$LungCap~LungCapData$Age)
summary(mod)
res <- residuals(mod)
fit <- fitted(mod)

# Add Predicted Values and Residuals into the dataframe
LungCapData2 <- LungCapData
LungCapData2$Residuals = res
LungCapData2$Pred.LungCap = fit
LungCapData2<-LungCapData2[c(1,2,8,7,3,4,5,6)]

# Plot Predictor Variabe "Age" against Response Variable "LungCap" to test linearity
library(ggplot2)
ggplot(LungCapData2, aes(x = Age, y = LungCap)) + geom_point() + ggtitle("Age vs Lung Capacity")

# Plot residuals to check independence
ggplot(LungCapData2, aes(x = Pred.LungCap, y = res)) + geom_point() + 
  ggtitle("Residuals vs Fitted") + geom_hline(yintercept = 0, color = "red")

# Check if observations are independent
ggplot(LungCapData2, aes(x = Age, y = res)) + geom_point() + ggtitle("Residuals vs Observed")

# Check for constant variance
ggplot(LungCapData2, aes(x = Pred.LungCap, y = Residuals)) + geom_point() + 
  ggtitle("Residuals vs Fitted") + geom_hline(yintercept = 0, color = "red")

# Check distribution of error terms
ggplot(LungCapData2, aes(x = Residuals)) + geom_histogram() + 
  ggtitle("Histogram of Residuals")

