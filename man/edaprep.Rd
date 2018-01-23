\name{edaprep}
\alias{edaprep}
\title{Dataset Preparation for Analysis
}
\description{
Prepare the dataset for exploratory data analysis
}
\usage{
edaprep(dataset)
}
\arguments{
  \item{dataset}{dataset with missing observations}
}
\details{
It replaces missing observation with the vector mean.
}
\value{
It returns \code{dataset} filled in with \code{NA}
}
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}, \code{\link{getmean}}, \code{\link{edaprep}}}
\examples{
data(miss)
c <- edaprep(miss)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
