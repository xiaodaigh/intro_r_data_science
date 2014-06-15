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
m <- lm(brain ~ log(body), data = animal.2)
summary(m)
```

```

Call:
lm(formula = brain ~ log(body), data = animal.2)

Residuals:
   Min     1Q Median     3Q    Max 
-153.8  -75.7  -44.9   55.3  351.3 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)    54.21      15.17    3.57  0.00072 ***
log(body)      43.78       4.97    8.81  3.2e-12 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 109 on 57 degrees of freedom
Multiple R-squared:  0.577,	Adjusted R-squared:  0.569 
F-statistic: 77.6 on 1 and 57 DF,  p-value: 3.16e-12
```

Modelling - Linear Regression
========================================================

```r
m <- lm(brain ~ log(body) - 1, data = filter(animal, body > 8000))
summary(m)
```

```

Call:
lm(formula = brain ~ log(body) - 1, data = filter(animal, body > 
    8000))

Residuals:
    1     2     3 
-17.2 -39.3  46.1 

Coefficients:
          Estimate Std. Error t value Pr(>|t|)  
log(body)     9.53       2.57    3.71    0.066 .
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 44.5 on 2 degrees of freedom
Multiple R-squared:  0.873,	Adjusted R-squared:  0.81 
F-statistic: 13.8 on 1 and 2 DF,  p-value: 0.0655
```
