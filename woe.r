woe <- function(raw, default, cp) {
  raw.cut <- addNA(cut(raw,c(-Inf,cp,Inf)))
  freq <- table(raw.cut, default)
  tot.b <- sum(default)
  tot.g <- length(default) - tot.b
  woe <- log(freq[,1] / freq[,2]) - log(tot.g / tot.b)
  woe[raw.cut]
}
