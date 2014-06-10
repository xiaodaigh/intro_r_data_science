Lesson 3 - Function
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050




R is a functional language
========================================================
- A function takes some inputs and produce an output
- funcitonal languages are programming languages where functions play a key and prominent role
- In R you can pass functions as arguments to functions
  - In a sense functions are treated like any other data
  - this is a hallmark of functional programming languages
  - The most hardcore functional languages don't use loops like **for** and **while**

Primitive & user-defined functions
========================================================
- There are two broad types of functions
  - primitive e.g max, min, sum
  - user defined

```r
# primitive function has the
sum
```

```
function (..., na.rm = FALSE)  .Primitive("sum")
```


Function
========================================================
You can define your own function

```r
# create a funciton that adds two numbers together
# the output of the function is by default the function's last line
add2 <- function(a,b) {
  a + b
}

# create a function that returns T is a is even
# or one can specify a returned value via the return function
is.even <- function(a) {
  if(a %% 2 ==0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

is.even(10)
```

```
[1] TRUE
```

```r
is.even(99)
```

```
[1] FALSE
```


User-defined function
========================================================
You Can see the function's source by entering the functions name in the console

```r
# see the source code for is.even
is.even
```

```
function(a) {
  if(a %% 2 ==0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
```


Functions & Closures (Advanced topic)
========================================================
- Function is just like any other data
- So a function can also return a function

```r
# create a function that starts counting from n
# and each time you run it it increments by one

increment <- function(n) {
  n <- n - 1
  
  increment.fn <- function() {
    n <<- n + 1
    return(n)
  }
  
  return(increment.fn)
}

# create a function that start counting at 8
incr8 <- increment(8)
```


Function & Closures (cont)
========================================================





```
Error in eval(expr, envir, enclos) : object 'incr' not found
```
