Lesson 5 - Linear Regression
========================================================
author: Dai ZJ
transition: rotate

Regression
========================================================
Linear Regression
- Finding the **line** of best fit?

Why did the name of regression come from?
- What does regression have to do the best fit? Nothing
- Came from study of father and son heights

The data
========================================================
Use the animal dataset
- body the body mass of a list of animals
- brain the brain szie of a list of animals

```r
animal <- read.csv("Animals2.csv")
head(animal)
```

```
                          X  body brain
1 Lesser short-tailed shrew 0.005  0.14
2          Little brown bat 0.010  0.25
3             Big brown bat 0.023  0.30
4                     Mouse 0.023  0.40
5                Musk shrew 0.048  0.33
6           Star-nosed mole 0.060  1.00
```

First step - inspect the data
========================================================

```r
require(dplyr)
plot(select(animal,brain,body))
```

![plot of chunk unnamed-chunk-2](lesson 5 - linear regression-figure/unnamed-chunk-2.png) 

First step - inspect the data
========================================================

```r
filter(animal,brain > 3000)
```

```
                 X body brain
1   Asian elephant 2547  4603
2 African elephant 6654  5712
```

```r
filter(animal, body > 8000)
```

```
              X  body brain
1   Triceratops  9400  70.0
2   Dipliodocus 11700  50.0
3 Brachiosaurus 87000 154.5
```

First step - inspect the data
========================================================

```r
animal.1 <- filter(animal, brain <= 3000, body <=8000)
plot(select(animal.1,body,brain))
```

![plot of chunk unnamed-chunk-4](lesson 5 - linear regression-figure/unnamed-chunk-4.png) 


First step - inspect the data
========================================================

```r
filter(animal.1, brain >= 1200)
```

```
      X body brain
1 Human   62  1320
```

```r
animal.2 <- filter(animal.1, X != "Human")
```

First step - inspect the data
========================================================

```r
plot(select(animal.2,body,brain))
```

![plot of chunk unnamed-chunk-6](lesson 5 - linear regression-figure/unnamed-chunk-6.png) 

Modelling - Linear Regression
========================================================
- The **lm** function is used for linear regression
- lm stands for linear models

```r
m <- lm(brain ~ body, data = animal.2)
# Obtain some summary statistics of the model
summary(m)
```

```

Call:
lm(formula = brain ~ body, data = animal.2)

Residuals:
   Min     1Q Median     3Q    Max 
-184.8  -34.5  -27.2    0.7  339.4 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  36.5723    10.9509    3.34   0.0015 ** 
body          1.2285     0.0841   14.61   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 77.1 on 57 degrees of freedom
Multiple R-squared:  0.789,	Adjusted R-squared:  0.786 
F-statistic:  213 on 1 and 57 DF,  p-value: <2e-16
```

Modelling - Linear Regression
========================================================

```r
m <- lm(brain ~ body, data = animal.2)
# Obtain some summary statistics of the model
summary(m)
```

```

Call:
lm(formula = brain ~ body, data = animal.2)

Residuals:
   Min     1Q Median     3Q    Max 
-184.8  -34.5  -27.2    0.7  339.4 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  36.5723    10.9509    3.34   0.0015 ** 
body          1.2285     0.0841   14.61   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 77.1 on 57 degrees of freedom
Multiple R-squared:  0.789,	Adjusted R-squared:  0.786 
F-statistic:  213 on 1 and 57 DF,  p-value: <2e-16
```

Modelling - Linear Regression
========================================================

```r
plot(select(animal.2,body, brain))
abline(m)
```

![plot of chunk unnamed-chunk-9](lesson 5 - linear regression-figure/unnamed-chunk-9.png) 

Modelling - Linear Regression
========================================================

```r
m <- lm(log(brain) ~ log(body), data = animal.2)
summary(m)
```

```

Call:
lm(formula = log(brain) ~ log(body), data = animal.2)

Residuals:
   Min     1Q Median     3Q    Max 
-1.674 -0.490 -0.035  0.475  1.664 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   2.1139     0.0914    23.1   <2e-16 ***
log(body)     0.7353     0.0299    24.6   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.659 on 57 degrees of freedom
Multiple R-squared:  0.914,	Adjusted R-squared:  0.912 
F-statistic:  603 on 1 and 57 DF,  p-value: <2e-16
```

How to assess linear regression models?
========================================================
- Check if the coefficients are significant
- Check the R-square
  - It represent the proportion of variance in the data explained by the model. It is a number from 0 to 1.00. The higher the better
- Assess the data visually
- Try a few transformations of the raw data and assess

Importance of visual inspection
========================================================

```r
m <- lm(log(brain) ~ log(body), data = animal.2)
summary(m)
```

```

Call:
lm(formula = log(brain) ~ log(body), data = animal.2)

Residuals:
   Min     1Q Median     3Q    Max 
-1.674 -0.490 -0.035  0.475  1.664 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   2.1139     0.0914    23.1   <2e-16 ***
log(body)     0.7353     0.0299    24.6   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.659 on 57 degrees of freedom
Multiple R-squared:  0.914,	Adjusted R-squared:  0.912 
F-statistic:  603 on 1 and 57 DF,  p-value: <2e-16
```
