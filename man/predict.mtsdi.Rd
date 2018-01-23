\name{predict.mtsdi}
\alias{predict.mtsdi}
\title{Imputed Dataset Extraction
}
\description{
Extract imputed dataset from a \code{mtsdi} object
}
\usage{
\method{predict}{mtsdi}(object, ...)
}
\arguments{
  \item{object}{imputation object}
  \item{\dots}{further options passed to the generic function \code{\link{predict}}}
}
\details{
 If log tranformation was used, dataset is back transformed accordingly. 
}
\value{
 A vector of of rows mean with lenght \eqn{n}, where \eqn{n} is the number of observations.
 }
\references{
Junger, W.L. and Ponce de Leon, A. (2015) Imputation of Missing Data in Time Series for Air Pollutants. Atmospheric Environment, 102, 96-104.

Johnson, R., Wichern, D. (1998) \emph{Applied Multivariate Statistical Analysis}. Prentice Hall.

Dempster, A., Laird, N., Rubin, D. (1977) Maximum Likelihood from Incomplete Data via the Algorithm EM. \emph{Journal of the Royal Statistical Society} 39(B)), 1--38.

McLachlan, G. J., Krishnan, T. (1997) \emph{The EM algorithm and extensions}. John Wiley and Sons.

Box, G., Jenkins, G., Reinsel, G. (1994) \emph{Time Series Analysis: Forecasting and Control}. 3 ed. Prentice Hall.

Hastie, T. J.; Tibshirani, R. J. (1990) \emph{Generalized Additive Models}. Chapman and Hall.

}
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}, \code{\link{getmean}}, \code{\link{edaprep}}}
\examples{
data(miss)
f <- ~c31+c32+c33+c34+c35
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
predict(i)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
