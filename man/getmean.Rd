\name{getmean}
\alias{getmean}
\title{Row Means Estimates
}
\description{
Estimate the row mean from a \code{mtsdi} object regarding a fixed number of imputed values
}
\usage{
getmean(object, weighted=TRUE, mincol=1, maxconsec=3)
}
\arguments{
  \item{object}{imputation object}
  \item{weighted}{If \code{TRUE}, weights returned by \code{\link{mnimput}} will be used form mean computation}
  \item{mincol}{integer for the minimun number of valid values by row}
  \item{maxconsec}{integer for the maximum number of consecutive missing values in a column}
}
\details{
 It is useful just in case one wants row mean estimated. If log tranformation was used, mean is adjusted accordingly. 
}
\value{
 A vector of of rows mean with length \code{n}, where \code{n} is the number of observations.
 }
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}, \code{\link{getmean}}, \code{\link{edaprep}}}
\examples{
data(miss)
f <- ~c31+c32+c33+c34+c35
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
m <- getmean(i,2)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
