\name{print.mtsdi}
\alias{print.mtsdi}
\title{Print Model Output}
\description{
Printing method for the imputation model
}
\usage{
\method{print}{mtsdi}(x, digits = getOption("digits"), ...)
}
\arguments{
  \item{x}{an object of class \code{summary.mtsdi}}
  \item{digits}{an integer indicating the decimal places. If not supplied, it is taken from \code{\link{options}}}
  \item{\dots}{further options passed to \code{\link{print}}}
}
\value{
This function does not return a value.
}
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}}
\examples{
data(miss)
f <- ~c31+c32+c33+c34+c35
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
print(i)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
