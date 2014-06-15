Lesson 5 - Classic Data Science Method
========================================================
author: Dai ZJ
width: 1650
height: 1050


Classic Algorithms
========================================================
Bread of butter
- Linear Regression (lm)
- K-means algorithms (kmeans)
- Logistic Regression (glm)
- Decision Tree (rpart)

Kmeans
========================================================
Finding clusters of points by locating the **centre** point of clusters
- Barclays Premiere League (BPL)
  - Twenty teams play each other 2 times per season
  - Team earn 3 points of each win, 1 for a draw and 0 for a loss
  - The team with most points win
- Can we identify the number of tiers of teams?

BPL
========================================================

```r
bpl <- read.csv("bpl.csv")
bpl
```

```
                   CLUB  W  D  L
1       Manchester City 27  5  6
2             Liverpool 26  6  6
3               Chelsea 25  7  6
4               Arsenal 24  7  7
5               Everton 21  9  8
6     Tottenham Hotspur 21  6 11
7     Manchester United 19  7 12
8           Southampton 15 11 12
9            Stoke City 13 11 14
10     Newcastle United 15  4 19
11       Crystal Palace 13  6 19
12         Swansea City 11  9 18
13      West Ham United 11  7 20
14           Sunderland 10  8 20
15          Aston Villa 10  8 20
16            Hull City 10  7 21
17 West Bromwich Albion  7 15 16
18         Norwich City  8  9 21
19               Fulham  9  5 24
20         Cardiff City  7  9 22
```

```r
# compute the points for each team
require(dplyr)
bpl <- mutate(bpl, pts = W*3 + D)
head(bpl)
```

```
               CLUB  W D  L pts
1   Manchester City 27 5  6  86
2         Liverpool 26 6  6  84
3           Chelsea 25 7  6  82
4           Arsenal 24 7  7  79
5           Everton 21 9  8  72
6 Tottenham Hotspur 21 6 11  69
```

Kmeans
========================================================
The kmeans

```r
# number of unique pts
# the number of groups cannot be greater than the number of point
fit <- kmeans(bpl$pts, 6)
plot(bpl$pts,y=rep(0,nrow(bpl)), col = fit$cluster)
points(fit$centers, rep(0,length(fit$centers)), pch = 21, bg = "black")
```

![plot of chunk unnamed-chunk-2](Lesson 5 - Classic Data Algorithms-figure/unnamed-chunk-2.png) 

```r
bpl$cluster <- fit$cluster
```

How many clusters?
========================================================
- Often choosing the number of clusters is more art than science
- How good a clustering is measured by the sum within cluster sum of squares (withinss)
- The (Euclidean) distance squared from the members of the clusters to the centre points
- withinss is good for comparing two competing clusters with the same k
- but not designed to compare clustering with the different number of clusterings

```r
fit$withinss
```

```
[1] 231.3 190.9 142.8
```

```r
fit$tot.withinss
```

```
[1] 565
```

How many clusters - elbow approach
========================================================
- Run kmeans based on 2 to as many clusters as you like
- plot the withinss by number of k for all the kmeans runs
- look for the elbow in the plot

```r
tot.withinss <- NULL
for(i in 2:length(unique(bpl$pts))) {
  fit <- kmeans(bpl$pts, i)
  tot.withinss <- c(tot.withinss, fit$tot.withinss)
}
plot(2:length(unique(bpl$pts)), tot.withinss, type="b")
```

![plot of chunk unnamed-chunk-4](Lesson 5 - Classic Data Algorithms-figure/unnamed-chunk-4.png) 

```r
# arguably there is not much improvement after 5 clusters
# you can see clearly very big improvements from 
```

Results check
========================================================
- Look at the results

```r
fit <- kmeans(bpl$pts, 5)
bpl$cluster <- fit$cluster
```

Kmeans - Multidimensional
========================================================
- Let's analysis the Iris dataset again
- We know there are 3 species

```r
fit.iris <- kmeans(select(iris,Sepal.Length:Petal.Width), 3)
fit.iris
```

```
K-means clustering with 3 clusters of sizes 96, 33, 21

Cluster means:
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1        6.315       2.896        4.974      1.7031
2        5.176       3.624        1.473      0.2727
3        4.738       2.905        1.790      0.3524

Clustering vector:
  [1] 2 3 3 3 2 2 2 2 3 3 2 2 3 3 2 2 2 2 2 2 2 2 2 2 3 3 2 2 2 3 3 2 2 2 3
 [36] 2 2 2 3 2 2 3 3 2 2 3 2 3 2 2 1 1 1 1 1 1 1 3 1 1 3 1 1 1 1 1 1 1 1 1
 [71] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 3 1 1 1 1 1 1
[106] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
[141] 1 1 1 1 1 1 1 1 1 1

Within cluster sum of squares by cluster:
[1] 118.652   6.432  17.670
 (between_SS / total_SS =  79.0 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"    
[5] "tot.withinss" "betweenss"    "size"         "iter"        
[9] "ifault"      
```

Kmeans - Multidimensional
========================================================
- Let's see how it did

```r
iris.cluster <- mutate(iris, cluster = fit.iris$cluster)
table(iris.cluster[,c("Species","cluster")])
```

```
            cluster
Species       1  2  3
  setosa      0 33 17
  versicolor 46  0  4
  virginica  50  0  0
```