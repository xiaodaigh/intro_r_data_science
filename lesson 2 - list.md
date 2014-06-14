List
========================================================
author: Dai ZJ
  
List is one of the most common data-types
========================================================

```r
a.list <- NULL
a.list$element1 <- 1
a.list$element2 <- c(1,2,3)
a.list
```

```
$element1
[1] 1

$element2
[1] 1 2 3
```

```r
# equivalently
a.list <- list(element1 = 1, element2 = c(1,2,3))
```


List is one of the most common data-types
========================================================
- Each list can have many child elements
- Child Elements are access by the $. E.g. list.name$child.element
- The child element can be of any type. E.g. you can have a list of lists
- The child elements don't have to be the same type of things
- Useful for grouping related information together

Funtions you can apply to lists
========================================================

```r
# the structure of the list
str(a.list)
```

```
List of 2
 $ element1: num 1
 $ element2: num [1:3] 1 2 3
```

```r
# the child element's names
names(a.list)
```

```
[1] "element1" "element2"
```


Accessing Elements
========================================================

```r
# access child elements by string name 
# [ ] gives a list
a.list["element1"] 
```

```
$element1
[1] 1
```

```r
a.list[c("element1","element2")] # gives a list
```

```
$element1
[1] 1

$element2
[1] 1 2 3
```

```r
# [[ ]] gives a vector
a.list[["element1"]] 
```

```
[1] 1
```



Exercises
========================================================
Create a list named dog, with 3 child elements 
- weight.kg = 3, 
- age.yrs = 2, 
- name = "Lassie"

Exercises (Solution)
========================================================

```r
# Create a list named dog, with 3 child elements weight.kg = 3, age.yrs = 2, name = "Lassie"
dog <- list(weight.kg = 3, age.yrs = 2, name = "Lassie")
```

