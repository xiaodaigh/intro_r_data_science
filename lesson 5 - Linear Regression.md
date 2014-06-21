Lesson 5 - Linear Regression
========================================================
author: Dai ZJ
transition: rotate

Regression
========================================================
Linear Regression
- Finding the **line** of best fit?

Why did the name of regression come from?
- What does regression have to do the best fit? 

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

![plot of chunk unnamed-chunk-2](lesson 5 - Linear Regression-figure/unnamed-chunk-2.png) 

First step - inspect the data
========================================================
Remove outliers

```r
filter(animal, brain > 3000)
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

![plot of chunk unnamed-chunk-4](lesson 5 - Linear Regression-figure/unnamed-chunk-4.png) 

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

![plot of chunk unnamed-chunk-6](lesson 5 - Linear Regression-figure/unnamed-chunk-6.png) 

Modelling - Linear Regression
========================================================
- The **lm** function is used for linear regression
- lm stands for linear models
- $y = a + bx + e$
- e is the error

```r
m <- lm(brain ~ body, data = animal.2)
```

Modelling - Linear Regression
========================================================

```r
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

What to look for?
========================================================
- The coefficients
- The p-value of coefficients
  - a test was performed to make sure that the coefficients is statistically significant
  - the lower the p-value the more statistically signficiant it is
  - a 5% threshold is usually used
- R-squared - a measure of the proportion of variation in the data explained by the model

What to look for?
========================================================

```r
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

![plot of chunk unnamed-chunk-10](lesson 5 - Linear Regression-figure/unnamed-chunk-10.png) 

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

Exercise
========================================================
- Using the cars data.frame Build a linear model to predict "dist" the stopping distance using speed
- Explain the result

Importance of visual inspection
========================================================
A single point, that is far away from the other points can cause big swing in results
- these points can be called outliers, but another name is leverage points

```r
cars1 <- rbind(cars,c(100,200))
lm(dist ~ speed, data = cars1)
```

```

Call:
lm(formula = dist ~ speed, data = cars1)

Coefficients:
(Intercept)        speed  
       8.61         2.20  
```

Importance of visual inspection
========================================================
A single point, that is far away from the other points can cause big swing in results
- these points can be called outliers, but another name is leverage points

```r
plot(cars1)
```

![plot of chunk unnamed-chunk-13](lesson 5 - Linear Regression-figure/unnamed-chunk-13.png) 

Multipe Linear Regression
========================================================
Multiple explanatory variable
$y = a + b_1x_1 + b_2x_2 + ... + b_nx_n$
where x_n are the data and a the intercept and b_i's the coefficients


```r
#install.packages("nutshell")
library(nutshell)
data(team.batting.00to08) # this makes the data.frame team.batting.00to08 available
names(team.batting.00to08)
```

```
 [1] "teamID"         "yearID"         "runs"           "singles"       
 [5] "doubles"        "triples"        "homeruns"       "walks"         
 [9] "stolenbases"    "caughtstealing" "hitbypitch"     "sacrificeflies"
[13] "atbats"        
```

```r
runs.mdl <- lm(runs ~ singles + doubles, data = team.batting.00to08)
```

Multipe Linear Regression
========================================================

```r
summary(runs.mdl)
```

```

Call:
lm(formula = runs ~ singles + doubles, data = team.batting.00to08)

Residuals:
   Min     1Q Median     3Q    Max 
-165.5  -43.5   -4.8   43.7  203.5 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  -22.885     70.916   -0.32     0.75    
singles        0.394      0.062    6.36  8.9e-10 ***
doubles        1.383      0.146    9.46  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 63.1 on 267 degrees of freedom
Multiple R-squared:  0.35,	Adjusted R-squared:  0.345 
F-statistic: 71.8 on 2 and 267 DF,  p-value: <2e-16
```

Things to watch out for
========================================================
$ y = a + 2x_1 + 3x_2 $
- The intepretation is: *holding everything constant* for every unit increase in x_1, y increases by 2,
- What if x_1 and x_2 are highly correlated?
- Highly correlated data can cause **multicollinearity**
- means the coefficients has high variability
- try removing 10% of your data and refit and see how much the coefficients changes
