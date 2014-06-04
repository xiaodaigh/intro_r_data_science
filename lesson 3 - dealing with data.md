Introduction to R and Data Science: Lesson 3 - Dealing with Data
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050




Reading in data
========================================================
- read.csv - allows you to read csv files
- read.xls - from the gdata package allows you to read xls files



```r
training <- read.csv("~/Dropbox/AnalytixWare/Data/Kaggle/cs-training.csv")

# view the data
# View(training)

require(gdata)
data.dict <- read.xls("~/Dropbox/AnalytixWare/Data/Kaggle/Data Dictionary.xls")
```


Simple Data Exploration
========================================================

```r
# give a frequency count of the unique values
table(training$SeriousDlqin2yrs)
```

```

     0      1 
139974  10026 
```

```r

# 10026 customers has defaulted 
# 139974 has not
# want to build a modle that can predict who is more likley to be in the 1 (defaulted) group

names(training)
```

```
 [1] "X"                                   
 [2] "SeriousDlqin2yrs"                    
 [3] "RevolvingUtilizationOfUnsecuredLines"
 [4] "age"                                 
 [5] "NumberOfTime30.59DaysPastDueNotWorse"
 [6] "DebtRatio"                           
 [7] "MonthlyIncome"                       
 [8] "NumberOfOpenCreditLinesAndLoans"     
 [9] "NumberOfTimes90DaysLate"             
[10] "NumberRealEstateLoansOrLines"        
[11] "NumberOfTime60.89DaysPastDueNotWorse"
[12] "NumberOfDependents"                  
```


Simple plot
========================================================

```r
# you can't tell anything
# definitely not the right way to visualise this type of data
plot(training$age, training$SeriousDlqin2yrs)
```

![plot of chunk unnamed-chunk-3](lesson_3_-_dealing_with_data-figure/unnamed-chunk-3.png) 


Good/Bad Odds (odds ratio)
========================================================

```r
freq <- table(training$age, training$SeriousDlqin2yrs)
head(freq)
```

```
    
       0   1
  0    1   0
  21 170  13
  22 398  36
  23 571  70
  24 718  98
  25 832 121
```

```r
gb.odds <- freq[,1] / freq[,2]
```


Good/Bad Odds (odds ratio)
========================================================

```r
# plot the Good/Bad Odds (odds ratio)
plot(gb.odds)
```

![plot of chunk unnamed-chunk-5](lesson_3_-_dealing_with_data-figure/unnamed-chunk-5.png) 


Good/Bad Odds (odds ratio)
========================================================

```r
# plot the Good/Bad Odds (odds ratio)
plot(rownames(freq),gb.odds)
```

![plot of chunk unnamed-chunk-6](lesson_3_-_dealing_with_data-figure/unnamed-chunk-6.png) 


What about for MonthlyIncome (1)
========================================================

```r
freq <- table(training$MonthlyIncome, training$SeriousDlqin2yrs)
gb.odds <- freq[,1] / freq[,2]
plot(gb.odds)
```

![plot of chunk unnamed-chunk-7](lesson_3_-_dealing_with_data-figure/unnamed-chunk-7.png) 



What about for MonthlyIncome (2)
========================================================

```r
plot(gb.odds)
```

![plot of chunk unnamed-chunk-8](lesson_3_-_dealing_with_data-figure/unnamed-chunk-8.png) 


pretty & cut (1)
========================================================

```r
cut.points <- pretty(training$MonthlyIncome[training$MonthlyIncome < 25000])
cut.points
```

```
[1]     0  5000 10000 15000 20000 25000
```

```r
MonthlyIncome.cut <- cut(training$MonthlyIncome, cut.points)
table(MonthlyIncome.cut)
```

```
MonthlyIncome.cut
      (0,5e+03]   (5e+03,1e+04] (1e+04,1.5e+04] (1.5e+04,2e+04] 
          54225           46091           13035            3181 
(2e+04,2.5e+04] 
            935 
```


pretty & cut (2)
========================================================

```r
freq <- table(MonthlyIncome.cut, training$SeriousDlqin2yrs)
gb.odds <- freq[,1] / freq[,2]
plot(gb.odds)
lines(lowess(gb.odds))
```

![plot of chunk unnamed-chunk-10](lesson_3_-_dealing_with_data-figure/unnamed-chunk-10.png) 


Summary
========================================================
- Use Good/Bad Odds (odds ratio) for binary outcome data
- Grouping data into bins can be an effective strategy (pretty & cut)

Logistic Regression Model
========================================================
- Perfect for binary outcome data
- $$ \log(\frac{p}{1-p}) =  \alpha_0 + \alpha_1 \times x_1 $$
- Use the binning approach
