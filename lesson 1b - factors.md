Lesson 1a - Factors
========================================================
author: Dai ZJ
transition: rotate
#width: 1650
#height: 1050


The factor data-type
========================================================
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

![plot of chunk unnamed-chunk-3](lesson 1b - factors-figure/unnamed-chunk-3.png) 

```r
table(iris$Species)
```

```

    setosa versicolor  virginica 
        50         50         50 
```
