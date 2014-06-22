mlmc <- function(raw, default) {
  # obtain a frequency of the good bad by each value of raw
  freq <- table(raw, default)
  # number of bads
  b <- freq[,2]
  # number of goods
  g <- freq[,1]
  # cumulative b
  cb <- cumsum(b)
  # cumulative g
  cg <- cumsum(g)
  
  
  cp <- NULL
  done <- FALSE
  # look for maximum cut points
  while(!done) {
    # cumulative bad rate
    dr <- cb / (cb + cg)
    # where is the maximum cumulative bad rate
    i <- which.max(dr)
    
    if (i == length(cb)) {
      done <- TRUE
      cp <- c(cp, c(cp, as.numeric(names(dr[i]))))
    } else if(dr[i] != 0) {
      cp <- c(cp, as.numeric(names(dr[i])))
      cg <- cg[(i+1):length(cg)] - cg[i]
      cb <- cb[(i+1):length(cb)] - cb[i]	
    } else if(dr[i] == 0) {
      cp <- cp[-length(cp)]
      done <- TRUE
    } else {
      done <- TRUE
    }
  }
  
  ct <- cut(raw, unique(c(-Inf,cp,Inf)))
  
  a1 <- table(ct, default)
  dr <- a1[,2] / (a1[,1] + a1[,2])
  list(tbl = cbind(a1, dr), cp = cp)
}