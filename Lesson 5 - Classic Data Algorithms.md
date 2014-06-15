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
fit <- kmeans(bpl$pts, 3)
plot(bpl$pts,y=rep(0,nrow(bpl)), col = fit$cluster)
points(fit$centers, rep(0,length(fit$centers)), pch = 2)
```

![plot of chunk unnamed-chunk-2](Lesson 5 - Classic Data Algorithms-figure/unnamed-chunk-2.png) 

```r
bpl$cluster <- fit$cluster
```
