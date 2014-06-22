# alternatively
iris.ratio <- mutate(iris, petal.ratio = Petal.Width / Petal.Length)
iris.ratio.filter <- filter(iris.ratio, petal.ratio < 0.3)
irf.grouped <- group_by(iris.ratio.filter, Species)
irfg.summ <- summarise(irf.grouped, mean.ratio = mean(petal.ratio), cnt = n())
irfg.summ
