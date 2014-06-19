Lesson 3 - The ply family of functions
=====================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050

apply & and ply-family of functions
=====================================
- The apply family of functions is important in the R world
- Most of what they can do can also be done with for/while loops 
- But apply is much faster

The apply function
=====================================
The apply function
- apply(matrix, MARGIN, function)
  - the matrix argument can actually be an array of more than 2 dimenions
  - MARGIN - 1 means vary the rows, 2 means vary the columns
  - function to apply
- e.g. apply(matrix, 1, sum)
  - for each row of the matrix, compute the sum
- e.g. apply(matrix, 2, sum)  
  - for each column of the matrix, compute the mean

The apply function (code)
=====================================

```r
## Prepare a simple matix
x <- cbind(x1 = 3, x2 = c(4:1, 2:4))

# column sum
col.sums1 <- apply(x, 2, sum)
col.sums1
```

```
x1 x2 
21 19 
```

```r
# this is equiavlent to
col.sums2 <- NULL
for(i in 1:ncol(x)) {
  col.sums2[colnames(x)[i]] <- sum(x[,i])
}
col.sums2
```

```
x1 x2 
21 19 
```

The other ply functions
=====================================
In the same family of functions
- lapply(X, FUN) 
  - use the FUN on every element in X
  - the output is a list 
- sapply(X,FUN)
  - the s stands for simplify
  - it's the same as lapply, except
  - its output is an array
  
The other ply functions (code)
=====================================

```r
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
lapply(x, mean)
```

```
$a
[1] 5.5

$beta
[1] 4.535

$logic
[1] 0.5
```

```r
sapply(x, mean)
```

```
    a  beta logic 
5.500 4.535 0.500 
```

Take aways
=====================================
- As much as possible use apply family of functions instead of for/while loops
  - It's faster
  - the more common R paradigm
  
Exercises
=====================================
- Using the apply function and find out the mean speed and dist in the cars data set
- Do the same with lapply and sapply

Exercises (Solution)
=====================================
- Using the apply function and find out the mean speed and dist in the cars data set
- Do the same with lapply and sapply

```r
apply(cars, 2, mean)
```

```
speed  dist 
15.40 42.98 
```

```r
lapply(cars, mean)
```

```
$speed
[1] 15.4

$dist
[1] 42.98
```

```r
sapply(cars, mean)
```

```
speed  dist 
15.40 42.98 
```
