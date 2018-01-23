\name{plot.mtsdi}
\alias{plot.mtsdi}
\title{Plot the Imputed Matrix}
\description{
This function produces a plot with imputed values and the estimated level for each of the columns in the imputed matrix.}
\usage{
\method{plot}{mtsdi}(x, vars = "all", overlay = TRUE, level = TRUE, 
	points = FALSE, leg.loc = "topright", horiz = FALSE, at.once = FALSE, ...)
}
\arguments{
  \item{x}{an object of the class \code{mtsdi}}
  \item{vars}{a vector with de variables to plot}
  \item{overlay}{logical. If \code{TRUE}, observed values are plot over the imputed ones}
  \item{level}{logical. If \code{TRUE}, the level is plot}
  \item{points}{logical. If \code{TRUE}, points on the observed and imputed values are plot}
  \item{leg.loc}{a list with \code{x} and \code{y} coordinates for the legend or a quoted string. Default is "topright". See Details}
  \item{horiz}{logical. If \code{TRUE}, the legend will horizontal oriented}
  \item{at.once}{logical. If \code{TRUE}, all the variables are plot in separate windows at once}
  \item{\dots}{further options for function \code{\link{plot}}}
}
\details{
The \code{leg.loc} option may also be specified by setting one of the following quoted strings \code{"bottomright"}, \code{"bottom"}, \code{"bottomleft"}, \code{"left"}, \code{"topleft"}, \code{"top"}, \code{"topright"}, \code{"right"}, or \code{"center"}. This places the legend on the inside of the plot frame at the given location with the orietation set by \code{horiz}. See \code{\link{legend}} for further details.
}
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}}
\examples{
data(miss)
f <- ~c31+c32+c33+c34+c35
i <- mnimput(f,miss,eps=1e-3,ts=TRUE, method="spline",sp.control=list(df=c(7,7,7,7,7)))
plot(i)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
