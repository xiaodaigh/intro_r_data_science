Lesson 2 - Flow Control & loops
========================================================
author: Dai ZJ
transition: rotate
width: 1650
height: 1050



Conditional branching - if
========================================================
The if statement is perhaps the most ubiquituous 


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


for loop
========================================================
If possible in R you should avoid using for loops

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


```
Error in parse(text = x, srcfile = src) : 
  attempt to use zero-length variable name
```
