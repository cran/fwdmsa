\name{plot.fs.n1.class}
\alias{plot.fs.n1.class}

\title{
Plot fs.n1.class objects
}

\description{
 S3 Method to \code{plot} objects of class fs.n1.class.
 Graphic display of the number of unique subsamples produced by multiple Forward Searches.
}
\usage{
\method{plot}{fs.n1.class}(
 x,
 cutoff=default.cutoff,
 n1.type=default.type,
 lwd=default.lwd,
 lty=default.lty,
 col=default.col,
 ylim = default.ylim, 
 xlim = default.xlim,
 ...)
}


\arguments{
  \item{x}{Object of \code{class fs.n1.class} produced by \code{\link{fs.MSA.n1}}.}
  \item{cutoff}{Default is the cutoff used for determining \eqn{n1} in \code{\link{fs.MSA.n1}}.}
  \item{n1.type}{Default is "unique" which shows number of unique subsamples; "major" shows the number of subsamples \emph{not} belonging to largest unique subsample; "both" plots both unique and major.}
  \item{lwd}{Line width}
  \item{lty}{Line type}
  \item{col}{Colour to be used for the lines.}
  \item{ylim, xlim}{Range of \code{x} and \code{y} values with sensible defaults.}
  \item{...}{Other arguments are ignored.}
}

\value{
 Returns a graph.
}

\references{
  Zijlstra, W. P., Van der Ark, L. A., and Sijtsma, K. (2011).
  Robust Mokken scale analysis by means of the forward search algorithm for outlier detection.
   \emph{Multivariate Behavioral Research, 46}, 58-89.
 }

\author{
 W. P. Zijlstra \email{w.p.zijlstra@uvt.nl}
}


\seealso{
\code{\link{fs.MSA.n1}}, \code{\link{fs.MSA}}, \code{\link{plot.fs.class}}
}

\examples{
\dontrun{
## Retrieve data (588 observations)
  data(acs)

# Determine n1 by running the Forward Search for Mokken scale analysis
# B=100 times 
  fwdmsa.res.n1 <- fs.MSA.n1(acs, B=100)

# Plot of number unique subsamples
  plot(fwdmsa.res.n1)

# Plot of number of subsamples not belonging to largest unique subsample (majority)
  plot(fwdmsa.res.n1,n1.type="major")
}
}
\keyword{aplot}
