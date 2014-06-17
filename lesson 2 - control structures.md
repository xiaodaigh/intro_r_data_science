Lesson 2 - Flow Control & loops
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050


Conditional branching - if
========================================================
The if statement is perhaps the most ubiquituous programming construct

```r
something.is.true <- TRUE
something.else.is.true <- TRUE

if (something.is.true) {
  #do this
} else if(something.else.is.true) {
  #do this other thing
} else {
  #do this is nothing else is true
}
```

```
NULL
```

Conditional branching - if example
========================================================
Compute the income tax
- http://www.iras.gov.sg/irashome/page04.aspx?id=1190

```r
income <- 110000
if (income <= 20000) {
  tax <- 0
} else if (income <= 30000) {
  tax <- 200 + (income - 20000) * 0.02
} else if (income <= 40000) {
  tax <- 350 + (income - 30000) * 0.035
} else if (income <= 80000) {
  tax <- 500 + (income - 40000) * 0.07
} else if (income <= 120000) {
  tax <- 3350 + (income - 80000) * 0.115
} else if (income <= 160000) {
  tax <- 7950 + (income - 120000) * 0.15
} else if (income <= 200000) {
  tax <- 13950 + (income - 160000) * 0.17
} else if (income <= 320000) {
  tax <- 20750 + (income - 200000) * 0.18
} else {
  tax <- 42350 + (income - 320000)  * 0.20
}

tax
```

```
[1] 6800
```

ifelse
========================================================
By assigning a value based on the true or false


```r
a <- ifelse(TRUE, 1, 2)
a
```

```
[1] 1
```

```r
b <- ifelse(a == 0, 1, 2)
b
```

```
[1] 2
```

```r
# ifelse works on vectors
v <- 1:5
v1 <- ifelse(v < 3, v, v * 2)
v1
```

```
[1]  1  2  6  8 10
```

for loop
========================================================
- If possible in R you should avoid using for loops
- The R programming style prefers vectorization
  - As much as possible AVOID code that deals with each element individual

```r
for(i in 1:3) {
  print(i)
}
```

```
[1] 1
[1] 2
[1] 3
```

while loop
========================================================

```r
i <- 0
while(i <= 2) {
  i <- i + 1
  print(i)
}
```

```
[1] 1
[1] 2
[1] 3
```

Exercises
========================================================
- Print all numbers below 100 skipping any number that is divisible by 2
  - Hint use the %% operation
- Find the prime factors of 24747. E.g. 15 has two factors, 3 and 5. 
  - a prime is a number that is wholly divisible by 1 or itself. The first few primes are 2, 3, 5, 7, 11
- (Advanced) Find the sum of all primes less than 100
