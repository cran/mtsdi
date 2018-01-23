\name{mnimput}
\alias{mnimput}
\title{Multivariate Normal Imputation
}
\description{Perform the modified EM algorithm imputation on a normal multivariate dataset
}
\usage{
mnimput(formula, dataset, by = NULL, log = FALSE, log.offset = 1, 
		eps = 1e-3, maxit = 1e2, ts = TRUE, method = "spline", 
		sp.control = list(df = NULL, weights = NULL), ar.control = 
		list(order = NULL, period = NULL), ga.control = list(formula, 
		weights = NULL), f.eps = 1e-6, f.maxit = 1e3, ga.bf.eps = 1e-6, 
		ga.bf.maxit = 1e3, verbose = FALSE, digits = getOption("digits"))
}
\arguments{
  \item{formula}{formula indicating the missing data frame, for instance, \code{~X1+X2+X3+...+Xp}}
  \item{dataset}{data with missing values to be imputated}
  \item{by}{factor for variance windows. Default is \code{NULL} for a single variance matrix}
  \item{log}{logical. If \code{TRUE} data will be transformed into \code{log} scale. Default is \code{FALSE}}
  \item{log.offset}{If \code{log} is \code{TRUE}, log values will be shifted by this offset. Default is 1}
  \item{eps}{stop criterion}
  \item{maxit}{maximum number of iterations}
  \item{ts}{logical. \code{TRUE} if is time series}
  \item{method}{method for univariate time series filtering. It may be \code{smooth}, \code{gam} or \code{arima}. See Details}
  \item{sp.control}{list for Spline smooth control. See Details}
  \item{ar.control}{list for ARIMA fitting control. See Details}
  \item{ga.control}{list for GAM fitting control. See Details}
  \item{f.eps}{convergence criterion for the ARIMA filter. See \code{\link{arima}}}
  \item{f.maxit}{maximum number of iterations for the ARIMA filter. See \code{\link{arima}}}
  \item{ga.bf.eps}{covergence criterion for the backfitting algorithm of GAM models. See \code{\link{gam}}}
  \item{ga.bf.maxit}{maximum number of iterations for the backfitting algorithm of GAM models. See \code{\link{gam}}}
  \item{verbose}{if \code{TRUE} convergence information on each iteration is printed. Default is \code{FALSE}}
  \item{digits}{an integer indicating the decimal places. If not supplied, it is taken from \code{\link{options}}}
}
\details{
This is a modified version of the EM algorithm for imputation of missing values. It is also applicable to time series data. When it is explicited the time series attribute through the argument \code{ts}, missing values are estimated accounting for both correlation between time series and time structure of the series itself.  Several filters can be used for prediction of the mean vector in the E-step.

One can select the method for the univariate time series filtering by the argument \code{method}. The default method is \code{"spline"}. In this case a smooth spline is fitted to each of the time series at each iteration. Some parameters can be passed to \code{\link{smooth.spline}} through \code{sm.control}. \code{df} is a vector as long as the number of columns in \code{dataset} holding fixed degrees of freedom of the splines. If \code{NULL}, the degrees of freedom of each spline are chosen by cross-validation. If \code{df} has length 1, this values is recycled for all the covariates. \code{weights} must be a matrix of the same size of \code{dataset} with the weights for \code{\link{smooth.spline}}. If \code{NULL}, all the observations will have weights equal to \eqn{1}. 

Other possibity for time series filtering is to fitting an ARIMA model for each of the time series by setting \code{method} to \code{"arima"}. The ARIMA models must be identified before using this function, nonetheless. \code{\link{arima}} function can be partially controlled through \code{ar.control}. Each column of \code{order} must hold the corresponding \eqn{(p,d,q)} parameters for each univariate time series if \code{period} is \code{NULL}. If \code{period} is not \code{NULL}, \code{order} must also hold the multiplicative seasonality parameters, so each column of \code{order} takes the form \eqn{(p,d,q,P,D,Q)}. \code{period} is the multiplicative seasonality period. \code{f.eps} and \code{f.maxit} control de convergence of the ARIMA fitting algorithm. Convergence problems due non stationarity may arise when using this option.

Last but not least, a very interesting approach to modelling temporal patterns to use a full fledged regression model. It is possible to use generalised aditive (or linear) models with exogenous variates to proper filtering of time patterns. One must set method to \code{gam} and supply a vector of formulas in \code{ga.control}. One must supply one formula for each covariate. Using covariates that are part of the formula of the imputation model may yield some colinearity among the variates. See \code{\link{gam}} and \code{\link{glm}} for details. In order to use regression models for the level, set \code{method} to \code{"gam"}
 
Simulations have shown that the algorithm is stable and yields good results on imputation of normal data.
}
\value{
The function returns an object of class \code{mtsdi} containing
  \item{call}{function call}
  \item{dataset}{imputed dataset}
  \item{muhat}{estimated mean vector}
  \item{sigmahat}{estimated covariance matrix}
  \item{missings}{vector holding the number of missing values on each row}
  \item{iterations}{number of iterations until convergence or reach \code{maxit}}
  \item{convergence}{convergence value. See Details}
  \item{converged}{a logical indicating if the algorithm converged}
  \item{time}{elapsed time of the process}
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
\seealso{\code{\link{mnimput}}, \code{\link{predict.mtsdi}}, \code{\link{edaprep}}}
\examples{
data(miss)
f <- ~c31+c32+c33+c34+c35
## one-window covariance
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
summary(i)

## two-window covariances
b<-c(rep("year1",12),rep("year2",12))
ii <- mnimput(f,miss,by=b,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
summary(ii)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
