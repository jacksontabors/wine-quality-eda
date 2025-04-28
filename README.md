---
title: "README"
output:
  github_document:
    pandoc_args: ["--wrap=none"]
always_allow_html: true
---
# Wine Quality Analysis

## Business Understanding

A wine producer has hired us to explore what factors most influence wine quality.  
Understanding these factors will help the producer improve the quality of their wines in future batches.  

According to research, wine quality can be influenced by several characteristics, including alcohol content, acidity, sugar concentration, pH, sulfur dioxide levels, and other chemical properties.  
For example, higher alcohol content often correlates with better quality ratings, while extreme acidity or sulfur levels can negatively impact taste.

The goal of this project is to perform Exploratory Data Analysis (EDA) to discover which measurable properties are associated with better wine quality, using the UCI Wine Quality Dataset.


## Data Understanding

We are working with two datasets from the UCI Machine Learning Repository:
- **Red Wine Dataset** (`winequality-red.csv`)
- **White Wine Dataset** (`winequality-white.csv`)

Each dataset contains physicochemical properties of wine samples and an associated quality score.

### Number of Samples and Features
- **Red Wine**: 1,599 samples (rows) and 12 features (columns) + 1 target variable (quality).
- **White Wine**: 4,898 samples (rows) and 12 features (columns) + 1 target variable (quality).

### Feature Descriptions and Data Types
Below is a list of features included in the datasets, along with a brief description and the type of measurement:

| Feature | Description | Data Type |
|:--------|:-------------|:----------|
| Fixed Acidity | Tartaric acid content | Ratio |
| Volatile Acidity | Acetic acid content (vinegar smell) | Ratio |
| Citric Acid | Citric acid content | Ratio |
| Residual Sugar | Amount of sugar remaining after fermentation | Ratio |
| Chlorides | Amount of salt content | Ratio |
| Free Sulfur Dioxide | SO₂ forms that protect wine from microbial spoilage | Ratio |
| Total Sulfur Dioxide | Total SO₂, both free and bound forms | Ratio |
| Density | Density of the wine | Ratio |
| pH | Acidity level | Ratio |
| Sulphates | Amount of potassium sulphate (adds to wine stability) | Ratio |
| Alcohol | Percentage alcohol content | Ratio |
| Quality | Quality score between 0 and 10 | Ordinal |

- **Most features are measured on a ratio scale** (meaning they have a true zero and consistent intervals).
- **Quality** is an **ordinal variable** because it represents ordered wine ratings assigned by experts.

### Missing Values
- No missing values were found in either dataset.

## Data Preparation

Before proceeding with the exploratory data analysis, we performed some basic data preparation steps:

- **Loading the datasets**: The red and white wine datasets were successfully loaded without any issues.
- **Checking for missing values**: No missing values were found in either dataset, so no imputation was necessary.
- **Checking data types**: All features are already in numeric format, which is appropriate for the types of analysis we plan to perform (e.g., correlation, statistical testing).
- **Feature consistency**: Both datasets have the same set of features, allowing for potential combined analysis if needed.
- **Outlier detection**: Preliminary checks on variables like residual sugar and alcohol show some potential outliers. We will handle these during the EDA stage if they appear to strongly influence results.
- **No additional transformations**: Since most variables are continuous and normalized similarly, no scaling or transformations were applied at this stage.

Thus, minimal data preparation was needed. We are ready to proceed with exploratory data analysis.


---



```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
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

# Double check missing values
sum(is.na(red_wine))
sum(is.na(white_wine))

# Corrected boxplots using periods

# Red wine residual sugar
boxplot(red_wine$residual.sugar,
        main = "Red Wine Residual Sugar", 
        horizontal = TRUE, 
        col = "pink")

# White wine residual sugar
boxplot(white_wine$residual.sugar,
        main = "White Wine Residual Sugar", 
        horizontal = TRUE, 
        col = "lightgreen")

# Red wine alcohol
boxplot(red_wine$alcohol,
        main = "Red Wine Alcohol Content", 
        horizontal = TRUE, 
        col = "lightblue")

# White wine alcohol
boxplot(white_wine$alcohol,
        main = "White Wine Alcohol Content", 
        horizontal = TRUE, 
        col = "lightyellow")





```

## Including Plots


```{r}
# Boxplot of Alcohol vs Quality (Red Wine)
boxplot(alcohol ~ quality, data = red_wine,
        main = "Red Wine: Alcohol Content by Quality",
        xlab = "Quality Score", ylab = "Alcohol Content",
        col = "tomato")

# Boxplot of Alcohol vs Quality (White Wine)
boxplot(alcohol ~ quality, data = white_wine,
        main = "White Wine: Alcohol Content by Quality",
        xlab = "Quality Score", ylab = "Alcohol Content",
        col = "lightblue")
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
