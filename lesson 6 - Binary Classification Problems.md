Lesson 3 - Logistic Regression
========================================================
author: Dai ZJ
transition: rotate
#width: 1650
#height: 1050



Read in the data
========================================================

```r
# read in the Kaggle sampled data
# from the Kaggle give me some credit competition
training <- read.csv("~/Dropbox/AnalytixWare/Data/Kaggle/cs-training-sample.csv")
nrow(training)
```

```
[1] 15000
```

The data
========================================================
SeriousDlqin2yrs - 1 means the customer was in serious delinquency
Terminology
- Bad - customer has serious delinquency
- Good - customer does not have serious delinquency
Try to build a model that predicts that

Simple Data Exploration
========================================================

```r
# give a frequency count of the unique values
table(training$SeriousDlqin2yrs)
```

```

    0     1 
14032   968 
```

```r
# 968 customers has defaulted 
# 14032 has not
# want to build a modle that can predict who is more likley to be in the 1 (defaulted) group

names(training)
```

```
 [1] "X"                                   
 [2] "X.1"                                 
 [3] "SeriousDlqin2yrs"                    
 [4] "RevolvingUtilizationOfUnsecuredLines"
 [5] "age"                                 
 [6] "NumberOfTime30.59DaysPastDueNotWorse"
 [7] "DebtRatio"                           
 [8] "MonthlyIncome"                       
 [9] "NumberOfOpenCreditLinesAndLoans"     
[10] "NumberOfTimes90DaysLate"             
[11] "NumberRealEstateLoansOrLines"        
[12] "NumberOfTime60.89DaysPastDueNotWorse"
[13] "NumberOfDependents"                  
```

Simple plot
========================================================

```r
# you can't tell anything
# definitely not the right way to visualise this type of data
plot(training$age, training$SeriousDlqin2yrs)
```

![plot of chunk unnamed-chunk-3](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-3.png) 

Default Rate
========================================================

```r
freq <- table(training$age, training$SeriousDlqin2yrs)
head(freq)
```

```
    
       0  1
  21  12  1
  22  42  2
  23  44  4
  24  93 14
  25  68 15
  26 107  8
```

```r
gb.odds <- freq[,1] / freq[,2]
# dr stands for default rate
dr <- freq[,2] / (freq[,1] + freq[,2])
```

Default Rate
========================================================

```r
# plot the Good/Bad Odds (odds ratio)
plot(dr)
```

![plot of chunk unnamed-chunk-5](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-5.png) 

Default Rate
========================================================

```r
# plot the Good/Bad Odds (odds ratio)
plot(sort(unique(training$age)), dr)
```

![plot of chunk unnamed-chunk-6](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-6.png) 

```r
#lines(lowess(dr))
```

What about for MonthlyIncome (1)
========================================================

```r
freq <- table(training$MonthlyIncome, training$SeriousDlqin2yrs)
dr <- freq[,1] / (freq[,1] + freq[,2])
plot(dr)
```

![plot of chunk unnamed-chunk-7](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-7.png) 


What about for MonthlyIncome (2)
========================================================

```r
plot(dr)
```

![plot of chunk unnamed-chunk-8](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-8.png) 

pretty & cut (1)
========================================================

```r
cut.points <- pretty(training$MonthlyIncome)
cut.points
```

```
[1]       0  500000 1000000 1500000 2000000 2500000 3000000 3500000
```

```r
MonthlyIncome.cut <- cut(training$MonthlyIncome, cut.points)
table(MonthlyIncome.cut)
```

```
MonthlyIncome.cut
      (0,5e+05]   (5e+05,1e+06] (1e+06,1.5e+06] (1.5e+06,2e+06] 
          11864               0               0               0 
(2e+06,2.5e+06] (2.5e+06,3e+06] (3e+06,3.5e+06] 
              0               0               1 
```

pretty & cut (2)
========================================================

```r
require(dplyr)
cut.points <- pretty(filter(training, MonthlyIncome < 25000)$MonthlyIncome)
cut.points
```

```
[1]     0  5000 10000 15000 20000 25000
```

```r
MonthlyIncome.cut <- cut(training$MonthlyIncome, c(-Inf,cut.points, Inf))
table(MonthlyIncome.cut)
```

```
MonthlyIncome.cut
       (-Inf,0]       (0,5e+03]   (5e+03,1e+04] (1e+04,1.5e+04] 
            176            5378            4604            1369 
(1.5e+04,2e+04] (2e+04,2.5e+04]  (2.5e+04, Inf] 
            309              84             121 
```

pretty & cut (2)
========================================================

```r
freq <- table(MonthlyIncome.cut, training$SeriousDlqin2yrs)
dr <- freq[,2] / (freq[,1] + freq[,2])
plot(dr, type = "b")
```

![plot of chunk unnamed-chunk-11](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-11.png) 

Summary
========================================================
- Use ratios for binary outcome data
- Grouping data into bins can be an effective strategy (pretty & cut)

Exercise
========================================================
- Explore the documentation for pretty (e.g. type ?pretty into the console)
- Cut the MonthlyIncome into roughly 10 cutpoints instead
- plot the default rate. Is there a clear trend?
- How do you explain where income goes up but default rate goes down?

Exercise (Solution)
========================================================

```r
cut.points.10 <- pretty(filter(training,MonthlyIncome<25000)$MonthlyIncome, n= 10)
Monthly.Income.cut10 <- cut(training$MonthlyIncome, c(-Inf,cut.points.10,Inf))
freq <- table(Monthly.Income.cut10, training$SeriousDlqin2yrs)
dr <- freq[,2] / (freq[,1] + freq[,2])
plot(dr)
```

![plot of chunk unnamed-chunk-12](lesson 6 - Binary Classification Problems-figure/unnamed-chunk-12.png) 

Can we group the data into bins with an unbroken DR% trends?
========================================================
Yes. Let's implement a simple monotone classifier (maximum likelihood monotone classifier)

```r
# source willl run the source code in another file
source("mlmc.r")
binning <- mlmc(training$MonthlyIncome, training$SeriousDlqin2yrs)
```

Exercise
========================================================
- Use the mlmc function to create binnings for NumberOfDependents. Explain the resutls
- Use the mlmc function to create binnings for -NumberOfDependents (i.e. negative Number of Dependents). Explain the results what can you say about the MLMC algorithm

Exercise (Solution)
========================================================

```r
# source willl run the source code in another file
source("mlmc.r")
binning <- mlmc(training$NumberOfDependents, training$SeriousDlqin2yrs)
binning.neg <- mlmc(-training$NumberOfDependents, training$SeriousDlqin2yrs)
```

Logistic Regression Model
========================================================
- Perfect for binary outcome data
- p is probability of non-default
- $$ \log(\frac{p}{1-p}) =  \alpha_0 + \alpha_1 \times x_1 $$
- Use the binning approach

Logistic Regression Model
========================================================
- Perfect for binary outcome data
- p is probability of non-default
- $$ \log(\frac{p}{1-p}) =  \alpha_0 + \alpha_1 \times x_1 $$
- Use the binning approach

Logistic Regression Model
========================================================
Weight of evidence (WOE) transformation
- commonly used in banking

```r
# create woe transformation from raw data and provided cut points (cp)
woe <- function(raw, default, cp) {
  raw.cut <- addNA(cut(raw,c(-Inf,cp,Inf)))
  freq <- table(raw.cut, default)
  tot.b <- sum(default)
  tot.g <- length(default) - tot.b
  woe <- log(freq[,1] / freq[,2]) - log(tot.g / tot.b)
  woe[raw.cut]
}

mlmc.mi <- mlmc(training$MonthlyIncome, training$SeriousDlqin2yrs)
woe.mi <- woe(training$MonthlyIncome, training$SeriousDlqin2yrs, mlmc.mi$cp)
```

Logistic Regression Model
========================================================

```r
m <- glm(relevel(as.factor(SeriousDlqin2yrs),ref="1") ~ woe.mi, data=training, family = binomial)
summary(m)
```

```

Call:
glm(formula = relevel(as.factor(SeriousDlqin2yrs), ref = "1") ~ 
    woe.mi, family = binomial, data = training)

Deviance Residuals: 
   Min      1Q  Median      3Q     Max  
-2.730   0.304   0.357   0.383   0.432  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)   2.6739     0.0336   79.54   <2e-16 ***
woe.mi        1.0000     0.1144    8.74   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 7177.9  on 14999  degrees of freedom
Residual deviance: 7097.3  on 14998  degrees of freedom
AIC: 7101

Number of Fisher Scoring iterations: 5
```

How to intepret the coefficients?
========================================================
- Intercept = a = 2.67386
- The average portfolio log(Good Bad Odds) is 2.67386
- $ln(p/(1-p)) = a + bx$ where p is probability of good
- ln(Prob(Good) / Prob(Bad)) = 2.67386 + 1 * WOE.Monthly Income
- woe = ln(Goods/Bads) - ln(overall Goods/Overall Bad)

Logistic Regression Model
========================================================
Weight of evidence (WOE) transformation
- commonly used in banking

```r
# create woe transformation from raw data and provided cut points (cp)
mlmc.age <- mlmc(training$age, training$SeriousDlqin2yrs)
woe.age <- woe(training$age, training$SeriousDlqin2yrs, mlmc.mi$cp)
# collapse last two bins
l <- length(mlmc.age$cp)
woe.age <- woe(training$age, training$SeriousDlqin2yrs, mlmc.age$cp[-l])
table(cut(training$age,c(-Inf,mlmc.age$cp[-l],Inf)), training$SeriousDlqin2yrs)
```

```
           
               0    1
  (-Inf,30]  910  133
  (30,43]   3122  302
  (43,47]   1276  106
  (47,49]    725   59
  (49,52]   1011   80
  (52,54]    647   46
  (54,55]    323   22
  (55,58]    994   59
  (58,59]    317   16
  (59,62]   1000   45
  (62,67]   1402   44
  (67,74]   1186   33
  (74,82]    790   18
  (82, Inf]  329    5
```

Exercise 
========================================================
- Create the woe version of all the varibles in the dataset
- Fit a logistics regression

Area under the curve
========================================================
How to assess the performance?
- AIC - lower the better, can be used to compare differnt models using the same data
- Area under the curve
  - also called GINI, accuracy ratio (AR)

```r
#install.packages("pROC")
require(pROC)
g <- roc(SeriousDlqin2yrs ~ woe.mi,data=training)
```

Predict 
========================================================
Scoring out another dataset

```r
scores <- predict(m, training[7500:15000,])
save(m, file="model.data")
load(file="model.data")
```

Sampling
========================================================
sample(X, size)
- X is a vector
- size the number of elements to sample WITHOUT replacement from x

Random Seed
========================================================
- set.seed to set the random seed so your sampling is repeatable

```r
set.seed(1)
sample(1:10, 3)
```

```
[1] 3 4 5
```

```r
sample(1:10, 3)
```

```
[1] 10  2  8
```

```r
set.seed(1)
sample(1:10, 3)
```

```
[1] 3 4 5
```

Typical modelling practise
========================================================
-Sample 70% of the data to build the model (development sample)
- Use the other 30% to validate your model (holdout sample)
- If you have the luxury use an "out-of-time" sample
  - a data differnt to your model sample periods

```r
training.sample <- training[sample(1:nrow(training), size = nrow(training)*0.7), ]
```

Exercise
========================================================
- Follow the modelling practise
- Build a logistc model using 70% training
- Score out the 30% holdout sample
- Compute the AUC (area under curve) for both the development and holdout sampel
