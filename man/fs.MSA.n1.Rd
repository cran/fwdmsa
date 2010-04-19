\name{fs.MSA.n1}
\alias{fs.MSA.n1}

\title{
Determining n1 for the Forward Search for Mokken Scale Analysis
}

\description{
Computes \eqn{n1} for the Forward Search for Mokken scale analysis
}

\usage{
fs.MSA.n1(
 X,
 B,
 cutoff = default.cutoff,
 initial.subsample.size = default.initial.subsample.size,
 minsize = default.minsize,
 seed = default.seed,
 verbose = TRUE)
}


\arguments{
  \item{X}{Matrix or data frame of numeric data containing the responses of \code{nrow(X)} respondents to \code{ncol(X)} items.
           Each row is called an \emph{observation}.
           Each item has \eqn{m+1} response options \eqn{0, \ldots, m}. Other scores (e.g., \eqn{1, \ldots, m+1}),
           are converted to \eqn{0, \ldots, m}.
           Missing values are not allowed.}
  \item{B}{Integer giving the number of Forward Searches with different initial subsamples.}
  \item{cutoff}{Integer, the first step of the Forward Search for which the number of unique subsamples is below the \code{cutoff} equals \eqn{n1}.}
  \item{initial.subsample.size}{Integer giving the size of the initial subsample.
                                By default \code{initial.subsample.size} equals the minimum of the number of restscore groups over all items multiplied by the number of items.}
  \item{minsize}{Integer giving the minimum size of a rest score group. By default
        \code{minsize} = \eqn{N/10} if \eqn{N \ge 500};
        \code{minsize} = \eqn{N/5 if} \eqn{250 \le N < 500}; and
        \code{minsize} = max\eqn{(N/3,50)} if \eqn{N < 250}}
  \item{seed}{Numberic; fixes the random number generation \code{set.seed} in order to control the initial subsample.
              Default is a randomly drawn value between 1 and 10000.}
  \item{verbose}{Logical, indicating whether \code{B} should be printed on the screen. If \code{FALSE}, no output is produced. The default is \code{TRUE}.}
}

\details{
Function \code{fs.MSA.n1} computes the required input for the forward plot (\code{\link{plot.fs.n1.class}}).
Therefore, its values should be assigned to an object.
\code{B} should at least be larger than \code{cutoff}, preferably \code{B}\eqn{\ge 100}.
Large values of \code{B} may take much computation time.
}

\value{
 \code{number.unique.subsamples}. The number of unique subsamples at each step of the Forward Search. \cr
 \code{n1}. The first step for which the number of unique subsamples is below the cutoff.
}

\references{
  Zijlstra, W. P., Van der Ark, L. A., and Sijtsma, K. (2010).
  \emph{Robust Mokken scale analysis by means of the forward search algorithm for outlier detection}.
  Manuscript submitted for publication.
 }

\author{
 W. P. Zijlstra \email{w.p.zijlstra@uvt.nl}
}

\seealso{
\code{\link{plot.fs.n1.class}}, \code{\link{fs.MSA}}, \code{\link{plot.fs.class}}
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
}
}
\keyword{univar}
