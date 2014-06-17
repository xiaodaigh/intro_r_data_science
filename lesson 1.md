Introduction to R and Data Science: Lesson 1
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050


About Me
========================================================  
- Name: Dai Zhuo Jia (ZJ)
- Australian-Chinese
- B.Sc (Pure maths) and Master of Statistics
- Been a useR since 2003
- Author of R package ShinySky (https://github.com/AnalytixWare/ShinySky)

What is R?
========================================================  
**R** is 
- a programming *environment*, not just a language
- for doing statistics (2000's - analytics, 2010's data science)
- first developed in New Zealand in 1998 by **R**oss Ihaka and **R**obert Gentleman
- it's actually based on the S language deviced in mid-1970's
- S is for statistics

Why Learn R?
========================================================
- Data Science is one of fastest growing fields
- R is one of the premiere languages in this field

What is R great for?
========================================================
- Statistical Analysis


```r
summary(cars)
```

```
     speed           dist    
 Min.   : 4.0   Min.   :  2  
 1st Qu.:12.0   1st Qu.: 26  
 Median :15.0   Median : 36  
 Mean   :15.4   Mean   : 43  
 3rd Qu.:19.0   3rd Qu.: 56  
 Max.   :25.0   Max.   :120  
```

What is R great for?
========================================================  
- Graphing

![plot of chunk unnamed-chunk-2](lesson 1-figure/unnamed-chunk-2.png) 

Starting out
========================================================  
- Install R (http://cran.rstudio.com/)
- Install RStudio (http://www.rstudio.com/ide/download/desktop)
- Go to the console
- type 1 + 1, then enter. You get


```r
1 + 1
```

```
[1] 2
```

R is interactive
========================================================  
- The result of what you type will get reflected right away
- R does not do integer arithmetics, so 3 / 2 does NOT give you 1

```r
3 / 2
```

```
[1] 1.5
```


Arithmetic in R
========================================================
Operation  | Usage | Usage
------------- | ------------- | -------------
Addition  | a + b | 
Subtraction  | a - b
Mulitplication  | a * b
Divison  | a / b
Exponetiation | a ^ b or a ** b
Modulo | a %% b | 5 %% 3 gives 2
Matrix Mult | a %*% b | 
  
Variables
========================================================
You can set values to variables, called **assignment**

```r
a = 1
b <- 2
3 -> d
e <- a + b + d
e
```

```
[1] 6
```

Variable Name Conventions
========================================================
Rule | Usage &  Example
------------- | ------------- 
Can use alphanumeric | a-z A-Z 0-9
. and _ can be used |  var.name & var_name are valid name
Cannot start with numbers or _ | 1name & _name are NOT allowed
Most other symbols (e.g. ,!~`'"-\$ ) can NOT be used | abc! is NOT a valid name 
Case SENSITIVE | abc & ABC are two distinct variable names

                    
Is this a valid variable name?
========================================================
- a_
- 1a2
- a1b
- ._
- _abc
- .89

Disregard all rules if you use backtick (`)
========================================================
Disregard all rules (except case sensivity) with back-tick \\`

```r
`1 whatever name you want !$` <- 100
`1 whatever name you want !$`
```

```
[1] 100
```

Vectors in R
========================================================
One of most useful and powerful features of R is working with vectors

The main command is **c** whichs stands for **c**ombine


```r
primes.1.to.5 <- c(2,3,5,7,11)
sum(primes.1.to.5)
```

```
[1] 28
```

```r
diff(primes.1.to.5)
```

```
[1] 1 2 2 4
```

More Vector Operations
========================================================

```r
primes.1.to.5 <- c(2,3,5,7,11)
max(primes.1.to.5)
```

```
[1] 11
```

```r
min(primes.1.to.5)
```

```
[1] 2
```

Set Operations
========================================================

```r
vector.a <- c(1,2,3)
vector.b <- c(3,4,5)
vector.c <- c(vector.a,vector.b)
vector.c
```

```
[1] 1 2 3 3 4 5
```

```r
unique(vector.c)
```

```
[1] 1 2 3 4 5
```

```r
intersect(vector.a, vector.b)
```

```
[1] 3
```

Sorting
========================================================

```r
vector.c.desc <- sort(vector.c, decreasing = TRUE)
vector.c.desc
```

```
[1] 5 4 3 3 2 1
```

```r
sort(vector.c.desc)
```

```
[1] 1 2 3 3 4 5
```

```r
# or simply return the order of the values
order(vector.c.desc)
```

```
[1] 6 5 3 4 2 1
```

Arithmetic Operations on vectors
========================================================
Every element in the vector happens

```r
numbers3 <- 1:5
numbers3 * 2
```

```
[1]  2  4  6  8 10
```

What happens internally
- R needs two vectors of the SAME length
- so 2 gets converted to c(2,2,2,2,2)
- then c(1,2,3,4,5) * c(2,2,2) = c(1 * 2, 2 * 2, 3 * 2,4 *2, 5 *2)
- gives c(2,4,6,8,10)

Vector Recycling
========================================================

```r
numbers3 <- 1:5
numbers3 * c(1,2)
```

```
[1] 1 4 3 8 5
```

Can you understand why?
- R needs two vectors of the SAME length
- so it **recycles** the shorter vector
- so c(1, 2) gets repeated up to c(1, 2, 1, 2, 1)
- c(1,2,3,4,5) * c(1,2,1,2,1) = c(1 * 2, 2 * 2, 3 * 1, 4 * 2, 5 * 1)
- gives c(1, 4,3 ,8 ,5)

Exercise
========================================================

```r
sum(2:5)
diff(10:15)
2:5 - 1
2:5 * 3
1:5 * 1:3
```

Exercise (Solution)
========================================================

```r
sum(2:5)
```

```
[1] 14
```

```r
diff(10:15)
```

```
[1] 1 1 1 1 1
```

```r
2:5 - 1
```

```
[1] 1 2 3 4
```

```r
2:5 * 3
```

```
[1]  6  9 12 15
```

```r
1:5 * 1:3
```

```
[1]  1  4  9  4 10
```

Number Indexing
========================================================

```r
numbers10 <- 1:5
numbers10[2]
```

```
[1] 2
```

```r
numbers10[2:4]
```

```
[1] 2 3 4
```

```r
numbers10[4:7]
```

```
[1]  4  5 NA NA
```

```r
# you can also use indexing to change the data to this
numbers10[2] <- 100
numbers10
```

```
[1]   1 100   3   4   5
```

```r
numbers10[c(1,3:4)] <- c(999, 999, 999)
numbers10
```

```
[1] 999 100 999 999   5
```

Number Indexing - removal
========================================================

```r
# you can remove the **i**th element by doing this
i = 4
numbers10[-i] # this will remove the 4th element
```

```
[1] 999 100 999   5
```

```r
# however numbers10 is actually not changed 
numbers10
```

```
[1] 999 100 999 999   5
```

```r
# to change the content of numbers10
numbers10 <- numbers10[-i]
```

Exercises
========================================================
- Create a vector (5, ...., 2, 1, 0, 1, 2,...,5)
- Remove the 0 element from the vector

Exercises (Solution)
========================================================

```r
x <- c(5:0,1:5)
x
```

```
 [1] 5 4 3 2 1 0 1 2 3 4 5
```

```r
x1 <- x[-6]
x1
```

```
 [1] 5 4 3 2 1 1 2 3 4 5
```

Boolean
========================================================
Boolean is the TRUE/FALSE data type
- TRUE or T
- FALSE or T
- == tests for equality e.g. 1 == 1 is TRUE 0 == 2 is FALSE
- 2 > 1 evaluates to TRUE
- 2 < 3 evaluates to FALSE

Boolean (TRUE/FALSE) Indexing
========================================================

```r
numbers10 <- 1:5
numbers10[c(T, F, T, F, T)]
```

```
[1] 1 3 5
```

Filtering
========================================================
Find all multiples of 2 less than or equal to 10

```r
numbers10 <- 1:10
numbers10[c(FALSE,TRUE)] # cycling
```

```
[1]  2  4  6  8 10
```

```r
numbers10 %% 2 == 0
```

```
 [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
```

```r
numbers10[numbers10 %% 2 == 0]
```

```
[1]  2  4  6  8 10
```

Exercise
========================================================
- Store all the multiple of 3s under 100 in a vector
- Store all the multiple of 5s less than or equal to 100 in a vector
- Find those numbers that are either multiples of 3 and/or multiples of 5, no repeats allowed
- Find their sum

Exercise (Solution)
========================================================

```r
# solution 1
multiple.3 <- (1:100)[1:100 %% 3 == 0]
multiple.5 <- (1:100)[1:100 %% 5 == 0]
final.ans <- unique(c(multiple.3, multiple.5))
sum(final.ans)
```

```
[1] 2418
```

```r
# solution 2
final.ans <- (1:100)[1:100 %% 3 == 0 | 1:100 %% 5 == 0]
sum(final.ans)
```

```
[1] 2418
```

Boolean Operations
========================================================
Name  | R Symbol | Example
------------- | ------------- | -------------
And  | & | 1 == 1 & 0 == 0
Or  | &#124;  | T &#124; F
Not | ! | 0 != 0, !1 == 1

Truth Table
========================================================
and (&)

a  | b | a & b
------------- | ------------- | -------------
FALSE | FALSE | FALSE
FALSE | TRUE | FALSE
TRUE | FALSE | FALSE
TRUE | TRUE | TRUE

or (|)

a  | b | a &#124; b
------------- | ------------- | -------------
FALSE | FALSE | FALSE
FALSE | TRUE | TRUE
TRUE | FALSE | TRUE
TRUE | TRUE | TRUE

Exercise
========================================================
Find the sum of all numbers below 100 that are a multiple of 3 but NOT a multiple of 5

Exercise (Solution)
========================================================
Find the sum of all numbers below 100 that are a multiple of 3 but NOT a multiple of 5

```r
numbers100 <- 1:100
final <- numbers100[numbers100 %% 3 == 0 & !numbers100 %% 5 ==0]
sum(final)
```

```
[1] 1368
```

More useful Boolean functions
========================================================

```r
# returns true if ANY element of the argument vector is TRUE
any(c(F,T,F))
```

```
[1] TRUE
```

```r
# returns true if ALL element of the argument vector is TRUE
all(c(F,T,F))
```

```
[1] FALSE
```

```r
all(c(T,T,T))
```

```
[1] TRUE
```

More useful vector functions - which family
========================================================
The **which** family of functions is extremely useful
- **which** accepts a vector of boolean and returns the index of the true position
- **which.min** & **which.max** returns the index of the FIRST minimum/maximum value

```r
which(1:10 > 5)
```

```
[1]  6  7  8  9 10
```

```r
which.min(c(1:3,0,0,4:6))
```

```
[1] 4
```

Exercise
========================================================
- Write a function that accepts two vectors as input and returns TRUE
  - if all the elements of the first vector is larger than the second vector
  - OR if one and only one element is in the first vector is larger then the second vector

Exercise (Solution)
========================================================

```r
ans.func <- function(x,y) {
  if(all(x >y)) {
    return(TRUE)
  } else if (length(which(x > y))) {
    return(TRUE)
  }
  return(FALSE)
}
```

Vector's elements must be of the same type
========================================================
You can a vector of numbers, boolean, and strings (characters)

```r
c(1,2,3)
```

```
[1] 1 2 3
```

```r
c(T,F,T)
```

```
[1]  TRUE FALSE  TRUE
```

```r
c(10,T,F,T,100)
```

```
[1]  10   1   0   1 100
```

Vector's elements must be of the same type
========================================================
If you mix the types it will converted to first, strings, and second, numerics.

```r
c("a","b","c")
```

```
[1] "a" "b" "c"
```

```r
c(1,"a",T)
```

```
[1] "1"    "a"    "TRUE"
```

The factor data-type
========================================================
We have studied
- numerics (integers and real numbers)
- boolean (true/false)
- strings (letters, and other characters and symbols)

Factors is a data type that is unique to R
- A factor is a finite set of values
- E.g. Male, Female can be the distinct values for a factor

```r
mf <- factor(c("Male","Female"))
mf
```

```
[1] Male   Female
Levels: Female Male
```

```r
# levels of a factor refers to the possible distinct values
levels(mf)
```

```
[1] "Female" "Male"  
```

Factors - continued
========================================================
- The *levels* are the external presentation of the factors
- Internally it's stored as integers (this fact is significant and can lead to some elegant code)

```r
mf
```

```
[1] Male   Female
Levels: Female Male
```

```r
as.numeric(mf)
```

```
[1] 2 1
```

- Factors can be ordinal or non-ordinal
- Ordinal - there is some natural order structure to it e.g. Income Brackets
- non-ordinal - no necessary order to it e..g apple, oranges, banana
  
Factors - Basic summary
========================================================

```r
summary(iris$Species)
```

```
    setosa versicolor  virginica 
        50         50         50 
```

```r
plot(iris$Species)
```

![plot of chunk unnamed-chunk-29](lesson 1-figure/unnamed-chunk-29.png) 

```r
table(iris$Species)
```

```

    setosa versicolor  virginica 
        50         50         50 
```

Seeking Help
========================================================
The documentation will show in the **Help** tab

```r
?sum
??deeper_search

# getting examples
example(min)
```

- The power of tab: type the first few characters of a function then press tab

Useful websites
- stackoverflow.com General programmings questions
