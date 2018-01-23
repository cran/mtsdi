\name{summary.mtsdi}
\alias{summary.mtsdi}
\title{Summary Information}
\description{
Print summary information on the imputation object
}
\usage{
\method{summary}{mtsdi}(object, ...)
}
\arguments{
  \item{object}{an object of class \code{mtsdi}}
  \item{\dots}{further options passed to \code{\link{print.summary.mtsdi}}}
}
\value{   
The function resturns a list containing
	\item{call}{function call}
	\item{muhat}{estimated mean vector}
	\item{sigmahat}{estimated covariance matrix}
	\item{iterations}{number of iterations used}
	\item{convergence}{relative difference of covariance determinant reached}
	\item{time}{time used in the process}
	\item{models}{details on the models used for time filtering}
	\item{log}{a logical indicating that data are log transformed}
	\item{log.offset}{offset used in the log transformation in order to avoid zeros}
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
\seealso{\code{\link{mnimput}}, \code{\link{predict}}}
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
