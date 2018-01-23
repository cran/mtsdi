\name{print.summary.mtsdi}
\alias{print.summary.mtsdi}
\title{Print Summary}
\description{
Printing method for the summary
}
\usage{
\method{print}{summary.mtsdi}(x, digits = getOption("digits"),  print.models = TRUE, ...)
}
\arguments{
  \item{x}{an object of class \code{summary.mtsdi}}
  \item{print.models}{a logical indicating that time filtering models should also be printed}
  \item{digits}{an integer indicating the decimal places. If not supplied, it is taken from \code{\link{options}}}
  \item{\dots}{further options passed from \code{\link{summary.mtsdi}}}
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
summary(i)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
