Lesson 4 - Fun with experiments
========================================================
author: Dai ZJ
transition: rotate
#width: 1650
#height: 1050



Experiment
========================================================

```r
set.seed(1)
good.students.score <- rnorm(50,75,15)
summary(good.students.score)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   41.8    69.4    76.9    76.5    85.9    98.9 
```

```r
bad.students.score <- rnorm(50,65,15)
summary(bad.students.score)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   37.9    56.4    66.7    66.8    74.1   101.0 
```

Experiment
========================================================

```r
# initialise a data.frame
all.students <- data.frame(
  score =  c(good.students.score, bad.students.score),
  mean = c(rep(75,50), rep(65,50)),
  std = rep(15,100)
                          )
head(all.students)
```

```
  score mean std
1 65.60   75  15
2 77.75   75  15
3 62.47   75  15
4 98.93   75  15
5 79.94   75  15
6 62.69   75  15
```

Experiment (3)
========================================================

```r
mean.score <- mean(all.students$score)

above.avg <- all.students[all.students$score > mean.score,]
summary(above.avg$score)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   72.1    74.6    82.5    82.7    87.1   101.0 
```

```r
below.avg <- all.students[all.students$score <= mean.score,]
summary(below.avg$score)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   37.9    54.2    62.6    59.6    67.4    71.2 
```

Experiment (4)
========================================================

```r
# give another test of similar difficulty to the above average group

names(above.avg) <- c("first.score", names(above.avg)[-1])
above.avg$second.score <- mapply(function(mean,std) {
  rnorm(1,mean,std)
}, above.avg$mean, above.avg$std)

summary(above.avg[c("first.score","second.score")])
```

```
  first.score     second.score  
 Min.   : 72.1   Min.   : 36.3  
 1st Qu.: 74.7   1st Qu.: 63.4  
 Median : 82.5   Median : 70.2  
 Mean   : 82.7   Mean   : 69.7  
 3rd Qu.: 87.1   3rd Qu.: 77.9  
 Max.   :101.0   Max.   :101.5  
```

Experiment (5)
========================================================

```r
# give another test of similar difficulty to the above average group
model <- lm(second.score ~ first.score, data = above.avg)
model.no.intercept <- lm(second.score ~ first.score-1, data = above.avg)
summary(model.no.intercept)
```

```

Call:
lm(formula = second.score ~ first.score - 1, data = above.avg)

Residuals:
   Min     1Q Median     3Q    Max 
-36.63  -5.92   0.33   6.89  37.93 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
first.score   0.8382     0.0256    32.7   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 15.4 on 51 degrees of freedom
Multiple R-squared:  0.954,	Adjusted R-squared:  0.954 
F-statistic: 1.07e+03 on 1 and 51 DF,  p-value: <2e-16
```

Experiemnt (6)
========================================================

```r
plot(above.avg[c("first.score","second.score")])
abline(0, coef(model.no.intercept))
abline(0, 1)
```

![plot of chunk unnamed-chunk-6](lesson 4 - Fun Experiments-figure/unnamed-chunk-6.png) 

Experiment - Coin Toss
========================================================
We toss a coin continuously until we observe a particular pattern

Left side of the room will win if we see Head-Tail-Tail appear first
Right of the room will win if we see Head-Tail-Head appear first

Which side is more likely to win?
- A. Even chances
- B. Left side is more likely to win
- C. Right side is more likely to win

Experiment - Coin Toss
========================================================

```r
ht <- factor(x = c("H","T"))
sample(ht,3,replace = TRUE)
```

```
[1] H T H
Levels: H T
```

```r
no.to.pattern <-function (pattern = factor(c("H","T","T"))) {
  browser()
  tosses <- sample(ht,3,replace = TRUE)
  no.tosses <- 3
  while(!identical(tosses, pattern)) {
    no.tosses <- no.tosses + 1
    tosses <- c(tosses[-1], sample(ht,1))
  }
  no.tosses
}
#no.to.pattern()
```
