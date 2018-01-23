\name{mstats}
\alias{mstats}
\title{Missing Dataset Statistics
}
\description{
Carry out some statistics from the incomplete dataset
}
\usage{
mstats(dataset)
}
\arguments{
  \item{dataset}{dataset with missing for description}
}
\details{
This function computes the proportion of missing observations in a given dataset by rows and columns.
}
\value{
A list containing
  \item{rows}{number of missing in each row}
  \item{columns}{number of missing in each column}
  \item{pattern}{the pattern of the missing values}
}
\author{Washington Junger \email{wjunger@ims.uerj.br} and Antonio Ponce de Leon \email{ponce@ims.uerj.br}
}
\seealso{\code{\link{mnimput}}, \code{\link{getmean}}, \code{\link{edaprep}}}
\examples{
data(miss)
mstats(miss)
}

\keyword{NA}
\keyword{multivariate}
\keyword{ts}
\keyword{smooth}
