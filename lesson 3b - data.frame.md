Lesson 2 - data.frame
========================================================
author: Dai ZJ
transition: rotate
#width: 1650
#height: 1050


Reading in stuctured data
========================================================
- read.csv - allows you to read csv files
- read.xls - from the gdata package allows you to read xls files



```r
#training <- read.csv("~/Dropbox/AnalytixWare/Data/Kaggle/cs-training.csv")
#set.seed(1)
#training.sample <- training[sample(1:nrow(training),nrow(training)/10),]
#write.csv(training.sample,"~/Dropbox/AnalytixWare/Data/Kaggle/cs-training-sample.csv")
# view the data
# View(training)

training <- read.csv("~/Dropbox/AnalytixWare/Data/Kaggle/cs-training-sample.csv")
require(gdata)
data.dict <- read.xls("~/Dropbox/AnalytixWare/Data/Kaggle/Data Dictionary.xls")
```

data.farme
========================================================
- In other languages (e.g. SAS) it call be called dataset, tables
- One of the most important data structures in R
- A data.frame is collection of **equal** length vectors
- **iris** and **cars** are two data.frames that come with R
- **head** function and **tails** function will show you the first & last few rows of the data.frame

```r
head(cars)
```

```
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
```

data.farme structrue
========================================================
- has row.names by default they are integers
- each column is a vector and can be accessed with $
- e.g. cars$speed

```r
head(cars$speed)
```

```
[1] 4 4 7 7 8 9
```

data.farme structrue
========================================================
- Let data be a data.frame
- Then data[1] wouldl give u the firs column of data
- then data[,1] gives the first column as a vector

```r
head(cars[1]) # keeps only the first colunm, but is still a data.frame
```

```
  speed
1     4
2     4
3     7
4     7
5     8
6     9
```

```r
head(cars[,1]) # keeps the first column as vector
```

```
[1] 4 4 7 7 8 9
```

```r
cars[1,] # keeps the first row of data
```

```
  speed dist
1     4    2
```

data.farme structrue
========================================================
Let rows and columns be vectors of integers then you access the rows columns of a data.frame
- data[rows,]
- data[, columns]
- data[rows, columns]

```r
cars[1,] # keeps the first row of data
```

```
  speed dist
1     4    2
```

data.frame subsetting
========================================================
- Indexing are of the form data.frame[rows, columns]
- data.frame[, columns] means show all rows
- data.frame[rows, ] means show all columns

```r
cars[5:10,] # the 5th to 10th row
```

```
   speed dist
5      8   16
6      9   10
7     10   18
8     10   26
9     10   34
10    11   17
```

data.frame subsetting
========================================================

```r
cars[5:10, 2] # the 5th to 10th row's second vector
```

```
[1] 16 10 18 26 34 17
```

```r
cars[5:10, ][2]
```

```
   dist
5    16
6    10
7    18
8    26
9    34
10   17
```

Exercise
========================================================
- What is the average speed?
- Find the row in the cars data.frame with the highest dist

Exercise (Solution)
========================================================

```r
mean(cars$speed)
```

```
[1] 15.4
```

```r
cars[cars$dist == max(cars$dist),]
```

```
   speed dist
49    24  120
```

data.frame functions
========================================================

```r
nrow(cars) # number of rows
```

```
[1] 50
```

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

data.frame functions
========================================================

```r
names(cars)
```

```
[1] "speed" "dist" 
```

```r
head(row.names(cars))
```

```
[1] "1" "2" "3" "4" "5" "6"
```

```r
head(rownames(cars))
```

```
[1] "1" "2" "3" "4" "5" "6"
```

data.frame functions
========================================================

```r
cars$dist / cars$speed
```

```
 [1] 0.5000 2.5000 0.5714 3.1429 2.0000 1.1111 1.8000 2.6000 3.4000 1.5455
[11] 2.5455 1.1667 1.6667 2.0000 2.3333 2.0000 2.6154 2.6154 3.5385 1.8571
[21] 2.5714 4.2857 5.7143 1.3333 1.7333 3.6000 2.0000 2.5000 1.8824 2.3529
[31] 2.9412 2.3333 3.1111 4.2222 4.6667 1.8947 2.4211 3.5789 1.6000 2.4000
[41] 2.6000 2.8000 3.2000 3.0000 2.3478 2.9167 3.8333 3.8750 5.0000 3.4000
```

Basic Data Exploration
========================================================
Histogram to investigate the correlation

```r
hist(cars$dist)
```

![plot of chunk unnamed-chunk-12](lesson 3b - data.frame-figure/unnamed-chunk-12.png) 

Basic Distribution Analysis
========================================================
A basic scatterplot

```r
plot(cars)
```

![plot of chunk unnamed-chunk-13](lesson 3b - data.frame-figure/unnamed-chunk-13.png) 

Basic Distribution Analysis
========================================================

```r
boxplot(cars)
```

![plot of chunk unnamed-chunk-14](lesson 3b - data.frame-figure/unnamed-chunk-14.png) 

data.frame - creating new columns
========================================================

```r
cars$dist.over.speed <- cars$dist / cars$speed
head(cars)
```

```
  speed dist dist.over.speed
1     4    2          0.5000
2     4   10          2.5000
3     7    4          0.5714
4     7   22          3.1429
5     8   16          2.0000
6     9   10          1.1111
```

```r
new.vector <- cars$dist / cars$speed
cars$new.vector <- new.vector
head(cars)
```

```
  speed dist dist.over.speed new.vector
1     4    2          0.5000     0.5000
2     4   10          2.5000     2.5000
3     7    4          0.5714     0.5714
4     7   22          3.1429     3.1429
5     8   16          2.0000     2.0000
6     9   10          1.1111     1.1111
```

data.frame - removing columns
========================================================

```r
cars$new.vector <- NULL
head(cars)
```

```
  speed dist dist.over.speed
1     4    2          0.5000
2     4   10          2.5000
3     7    4          0.5714
4     7   22          3.1429
5     8   16          2.0000
6     9   10          1.1111
```

```r
cars[,3] <- NULL
head(cars)
```

```
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
```

data.frame - removing columns cont
========================================================

```r
cars$new.vector <- new.vector
head(cars)
```

```
  speed dist new.vector
1     4    2     0.5000
2     4   10     2.5000
3     7    4     0.5714
4     7   22     3.1429
5     8   16     2.0000
6     9   10     1.1111
```

```r
cars[,"new.vector"] <- NULL
head(cars)
```

```
  speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
```

data.frame - cbind & rbind
========================================================
- cbind - column bind
- rbind - row bind

```r
new.cars <- cbind(cars, new.vector)
head(new.cars)
```

```
  speed dist new.vector
1     4    2     0.5000
2     4   10     2.5000
3     7    4     0.5714
4     7   22     3.1429
5     8   16     2.0000
6     9   10     1.1111
```

```r
cars.head.tails <- rbind(head(cars),tail(cars))
cars.head.tails
```

```
   speed dist
1      4    2
2      4   10
3      7    4
4      7   22
5      8   16
6      9   10
45    23   54
46    24   70
47    24   92
48    24   93
49    24  120
50    25   85
```

Exercises
========================================================
- Using the cars data.frame
- Create a new column called ratio = dist / speed
- Create a new column ratio2 = ratio^2
- remove the column ratio
- What is the sum of ratio2


Exercises (Solution)
========================================================


```
Error in parse(text = x, srcfile = src) : <text>:2:28: unexpected input
1: cars$ratio <- cars$speed/cars$dist
2: cars$ratio2 <- cars$ratio^2\
                              ^
```
