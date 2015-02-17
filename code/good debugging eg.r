k.capital <- function(pd, lgd, asset.class = c("Mortgage", "QRRE", "Retail Other"), r = NULL) {
  # the correlation
  asset.class <- match.arg(asset.class)
  if(is.null(r)) {
    if (asset.class == "Mortgage") {
      r <- 0.15
    } else if (asset.class == "QRRE")    {
      r <- 0.04
    } else if (asset.class == "Retail Other")    {
      r <- 0.03*(1-exp(-35*pd))/(1-exp(-35))+0.16*(1-(1-exp(-35*pd)))/(1-exp(-35))
    }
  }
  
  lgd*(pnorm(sqrt(1/(1-r)*qnorm(pd))) + sqrt(r/(1-r)*qnorm(pd)) - pd)
}

k
