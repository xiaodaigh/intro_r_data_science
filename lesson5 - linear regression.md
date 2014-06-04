Introduction to R and Data Science: Lesson 4 - Fun with experiments
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050

Regression
========================================================
  Linear Regression
- Finding the **line** of best fit?

Why did the name of regression come from?
- What does regression have to do the best fit? Nothing
- Came from study of test scores

Modelling - Linear Regression
========================================================

```r
animal <- read.csv("Animals2.csv")
m <- lm(brain ~ body, data = animal)
#plot(m)
# Obtain some summary statistics of the model
summary(m)
```

```

Call:
lm(formula = brain ~ body, data = animal)

Residuals:
   Min     1Q Median     3Q    Max 
  -486   -262   -249   -110   5417 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)  
(Intercept) 266.3158   115.1575    2.31    0.024 *
body          0.0043     0.0105    0.41    0.683  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 915 on 63 degrees of freedom
Multiple R-squared:  0.00267,	Adjusted R-squared:  -0.0132 
F-statistic: 0.169 on 1 and 63 DF,  p-value: 0.683
```

