# Load the red wine data
red_wine <- read.csv("winequality-red.csv", sep = ";")

# Load the white wine data
white_wine <- read.csv("winequality-white.csv", sep = ";")

# View the structure of the red wine data
str(red_wine)

# View the structure of the white wine data
str(white_wine)

# Number of rows and columns
dim(red_wine)   
dim(white_wine)

colnames(red_wine)
colnames(white_wine)

# Summary for red wine
summary(red_wine)

# Summary for white wine
summary(white_wine)

# Check missing values
sum(is.na(red_wine))
sum(is.na(white_wine))

# Check missing values
sum(is.na(red_wine))
sum(is.na(white_wine))

# Double check missing values
sum(is.na(red_wine))
sum(is.na(white_wine))

head(red_wine)
head(white_wine)


# Quick boxplots to visualize potential outliers
boxplot(red_wine$`residual sugar`, main = "Red Wine Residual Sugar", horizontal = TRUE)
boxplot(white_wine$`residual sugar`, main = "White Wine Residual Sugar", horizontal = TRUE)

boxplot(red_wine$alcohol, main = "Red Wine Alcohol Content", horizontal = TRUE)
boxplot(white_wine$alcohol, main = "White Wine Alcohol Content", horizontal = TRUE)
