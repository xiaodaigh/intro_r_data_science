Lesson 3 - Modern data manipulation
========================================================
author: Dai ZJ
width: 1650
height: 1050


Modern data manipulation
========================================================
- R is continually improving 
- R programmers write packages and publish them for other to use for free
  - Alot of academic papers now publish a R pacakge along with their paper
- Number of R packages on CRAN has recently exceeded 5000


Important Repositories of R packages
========================================================
- The Comprehensive R Archive Network (CRAN)
  - The largest repository; easy to install things
  - cran.rstudio.com
- GitHub
  - Easy installation with the devtools package
  - Increasingly popular
- Bioconductor (bioconductor.org)
  - Bioscience related package
  - High quality packages; more curated
  
Installing packages
========================================================
A Google search will usually tell you the package you need

```r
# install a package from CRAN by name
#install.packages("devtools")

# install a package from github
# devtools::install_github("hadley/dplyr")
```

Package Basics
========================================================
- Once a package has been installed you can use the **require** or **library** functions to include them

```r
# either of the below is sufficient to include the package in your code
require(dplyr)
library(dplyr)
```

Pakcage Basics
========================================================
You can access a package's functions via ::

```r
# you can directly access the functions the package has via ::
# using :: I can run functions and do not need to library or require the pacakge first
# devtools::install_github
```

The plyr & dplyr package
========================================================
- Developed by Hadley Wickam, one of luminaries in the R world
- plyr is one of the most popular R data packages
- dplyr was intended as a much faster replacement of plyr

The plyr & dplyr package (cont)
========================================================
- Both packages employ divide-compute-combine strategies extensively
- Let's study some data manipulation techiqnues with the **iris** data.frame
- **iris** data
  - It's a set of four measurements, namely, Sepal Length & width and petal length & width
  - for 3 species of iris setosa, versicolor, virginica

```r
head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

The iris data.frame
========================================================
- Explore the iris data

```r
nrow(iris)
```

```
[1] 150
```

```r
summary(iris)
```

```
  Sepal.Length   Sepal.Width    Petal.Length   Petal.Width 
 Min.   :4.30   Min.   :2.00   Min.   :1.00   Min.   :0.1  
 1st Qu.:5.10   1st Qu.:2.80   1st Qu.:1.60   1st Qu.:0.3  
 Median :5.80   Median :3.00   Median :4.35   Median :1.3  
 Mean   :5.84   Mean   :3.06   Mean   :3.76   Mean   :1.2  
 3rd Qu.:6.40   3rd Qu.:3.30   3rd Qu.:5.10   3rd Qu.:1.8  
 Max.   :7.90   Max.   :4.40   Max.   :6.90   Max.   :2.5  
       Species  
 setosa    :50  
 versicolor:50  
 virginica :50  
                
                
                
```

The iris data.frame
========================================================
- What is the average petal length for each fo the Species

```r
require(dplyr)
# create an intermediate "grouped data"
iris.grouped <- group_by(iris,Species)
iris.summ <-summarise(iris.grouped, Avg.Petal.Length = mean(Petal.Length))
iris.summ
```

```
Source: local data frame [3 x 2]

     Species Avg.Petal.Length
1     setosa            1.462
2 versicolor            4.260
3  virginica            5.552
```

The "grouped" data
========================================================

```r
iris.grouped
```

```
Source: local data frame [150 x 5]
Groups: Species

   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1           5.1         3.5          1.4         0.2  setosa
2           4.9         3.0          1.4         0.2  setosa
3           4.7         3.2          1.3         0.2  setosa
4           4.6         3.1          1.5         0.2  setosa
5           5.0         3.6          1.4         0.2  setosa
6           5.4         3.9          1.7         0.4  setosa
7           4.6         3.4          1.4         0.3  setosa
8           5.0         3.4          1.5         0.2  setosa
9           4.4         2.9          1.4         0.2  setosa
10          4.9         3.1          1.5         0.1  setosa
..          ...         ...          ...         ...     ...
```

Summarise 
========================================================

```r
iris.summ <- summarize(iris.grouped, Avg.Petal.Length = mean(Petal.Length), Std.Petal.Length = sd(Petal.Length))
# mult
iris.summ
```

```
Source: local data frame [3 x 3]

     Species Avg.Petal.Length Std.Petal.Length
1     setosa            1.462           0.1737
2 versicolor            4.260           0.4699
3  virginica            5.552           0.5519
```

dplyr Chaining
========================================================
- Chaining is a powerful dplyr construct
- Easy to follow

```r
# the same task but with chaining
# you can chain dplyr operation together with %.%
iris %.% group_by(Species) %.% summarise(Avg.Petal.Length = mean(Petal.Length))
```

```
Source: local data frame [3 x 2]

     Species Avg.Petal.Length
1     setosa            1.462
2 versicolor            4.260
3  virginica            5.552
```

Exercises
========================================================
Write a dplyr program that computes the median Sepal.Width for each species

Exercise (Solution)
========================================================
Write a dplyr program that computes the median Sepal.Width for each species

```r
iris %.% group_by(Species) %.% summarise(Avg.Sepal.Width = mean(Sepal.Width))
```

```
Source: local data frame [3 x 2]

     Species Avg.Sepal.Width
1     setosa           3.428
2 versicolor           2.770
3  virginica           2.974
```

The filter() 
========================================================
How to keep only data about the setosa species where the Petal width is > 0.5

```r
# basic syntax
iris.filter <- iris[iris$Species == "setosa" & iris$Petal.Width > 0.5,] 
# dplyr syntax
iris.filter <- filter(iris, Species == "setosa", Petal.Width > 0.5)
head(iris.filter)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1            5         3.5          1.6         0.6  setosa
```

Sorting - dplyr::arrange
========================================================
You can sort the data using the arrange function

```r
# sort by descending order on Species and ascending order by petal length
iris.sorted <- arrange(iris, desc(Species), Petal.Length)
head(iris.sorted)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
1          4.9         2.5          4.5         1.7 virginica
2          6.2         2.8          4.8         1.8 virginica
3          6.0         3.0          4.8         1.8 virginica
4          5.6         2.8          4.9         2.0 virginica
5          6.3         2.7          4.9         1.8 virginica
6          6.1         3.0          4.9         1.8 virginica
```

dplyr::select
========================================================
Allows the user to easily select the columns he wants

```r
# show only Petal.Width & Species
head(select(iris, Petal.Width, Species))
```

```
  Petal.Width Species
1         0.2  setosa
2         0.2  setosa
3         0.2  setosa
4         0.2  setosa
5         0.2  setosa
6         0.4  setosa
```

dplyr::select
========================================================
Allows the user to easily select the columns he wants

```r
# Can use a:b to show all columns from a to b
head(select(iris, Petal.Length:Species))
```

```
  Petal.Length Petal.Width Species
1          1.4         0.2  setosa
2          1.4         0.2  setosa
3          1.3         0.2  setosa
4          1.5         0.2  setosa
5          1.4         0.2  setosa
6          1.7         0.4  setosa
```

dplyr::select
========================================================
Allows the user to easily select the columns he wants

```r
# Can use -(a:b) to show all columns but b
head(select(iris, -(Petal.Length:Species)))
```

```
  Sepal.Length Sepal.Width
1          5.1         3.5
2          4.9         3.0
3          4.7         3.2
4          4.6         3.1
5          5.0         3.6
6          5.4         3.9
```

dplyr::mutate
========================================================
Creating new factors

```r
iris.ratio <- iris %.% 
  mutate(Petal.ratio = Petal.Length / Petal.Width) %.% 
  select(Petal.Length:Species, Petal.ratio)
head(iris.ratio)
```

```
  Petal.Length Petal.Width Species Petal.ratio
1          1.4         0.2  setosa        7.00
2          1.4         0.2  setosa        7.00
3          1.3         0.2  setosa        6.50
4          1.5         0.2  setosa        7.50
5          1.4         0.2  setosa        7.00
6          1.7         0.4  setosa        4.25
```
