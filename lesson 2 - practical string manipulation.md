Lesson 2 - Practical String Manipulation
========================================================
author: Dai ZJ

Strings
========================================================
- A string of characters
- Strings can be enclosed in "" or ''

```r
a <- "this is a string!"
a
```

```
[1] "this is a string!"
```

```r
b <- as.character(123)
b
```

```
[1] "123"
```

Basic String manipulation - paste cont
========================================================
- One of the most common string functions is **paste**
- it can concatenate strings together

```r
# concanates two strings together with a space in between
paste(c("a","b","c"), c(1,2,3))
```

```
[1] "a 1" "b 2" "c 3"
```

Basic String functions
========================================================

```r
# nchar gives the number of characters in a string
nchar("?~!abc")
```

```
[1] 6
```

```r
# substring using substr(string, start, stop) function
substr("abcef", 3, 4)
```

```
[1] "ce"
```

```r
# the letters variables
letters
```

```
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q"
[18] "r" "s" "t" "u" "v" "w" "x" "y" "z"
```

Exercise
========================================================
- Create this string "a1b2c3...z26"
- Write a function that reverses a string

Exercise (Solution)
========================================================
- Create this string "a1b2c3...z26"

```r
# create the string a1b2c3...z26
paste0(letters,1:26,collapse = "")
```

```
[1] "a1b2c3d4e5f6g7h8i9j10k11l12m13n14o15p16q17r18s19t20u21v22w23x24y25z26"
```

Exercise (Solution)
========================================================
- Write a function that reverses a string (advanced)

```r
# a funciton that reverse a string
strReverse <- function(x) {
  x.rev <- ""
  for(i in nchar(x):1) {
    x.rev <- paste0(x.rev, substring(x, i, i))
  }
  x.rev
}

# or more advanced
strReverse <- function(x) {
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse="")
}
```

String Split
========================================================
One of the most useuful functions is to be able to break up a string

```r
# split the string into a vector by " "
strsplit("a b c", " ")
```

```
[[1]]
[1] "a" "b" "c"
```

```r
# split every character into a vector
strsplit("a b c", NULL)
```

```
[[1]]
[1] "a" " " "b" " " "c"
```

Exercise
========================================================
- A palidrome is string that when reverse is the same as the original string. E.g. aabaa is a palindrome while abab is not. Write a function that tests if a string is a palindrome
- **combn(vector,n)** is a function that takes a vector and n and returns all n element ombinations of the vector. E.g try combn(c(1:3), 2)
- (Advanced) Find the largest palindrome integer that is the product of two 2-digits integers
  - You may find the **which** function useful

Exercise (Solution)
========================================================

```r
# an efficient version of string reverse function
strReverse <- function(x) {
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse="")
}

# checks if a string is a palindrome
is.palindrome <- function(s) {
  s.rev <- strReverse(s)
  s == s.rev
}
```

Exercise (Solution) cont
========================================================

```r
# all possible 2-digit integers
a <- 10:99
# a palinrome cannot end with a 0 so remove all multiples of 10
a <- setdiff(11:99, seq(10,90,by=10))
# create all the combinations of 2-digit numbers
a.pair <- combn(a,2)
# find the product of all possible two digit numbers
a.product <- a.pair[1,] * a.pair[2,]
# convert the product to characters
product.char <- as.character(a.product)
# find all palindrome integers index
w <- which(is.palindrome(product.char))
# return the answer
max(a.product[w])
```

```
[1] 9009
```
