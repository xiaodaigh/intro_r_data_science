mlmc <- function(raw, default) {
  freq <- table(raw, default)
  b <- freq[,2]
  g <- freq[,1]
  cb <- cumsum(b)
  cg <- cumsum(g)
  cp <- NULL
  done <- FALSE
  while(!done) {
    dr <- cb / (cb + cg)
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