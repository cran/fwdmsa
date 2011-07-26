\name{fs.MSA}
\alias{fs.MSA}

\title{
Forward Search for Mokken Scale Analysis
}

\description{
Computes the necessary input for forward plots for Mokken scale analysis
}

\usage{
fs.MSA(
 X, 
 initial.subsample = "random", 
 initial.subsample.size = default.initial.subsample.size, 
 minsize = default.minsize, 
 seed = default.seed,
 n.low = default.n.low,  
 verbose = TRUE)
}


\arguments{
  \item{X}{Matrix or data frame of numeric data containing the responses of \code{nrow(X)} respondents to \code{ncol(X)} items. 
           Each row is called an \emph{observation}.
           Each item has \eqn{m+1} response options \eqn{0, \ldots, m}. Other scores (e.g., \eqn{1, \ldots, m+1}),
           are converted to \eqn{0, \ldots, m}.
           Missing values are not allowed.}
  \item{initial.subsample}{Default is "random". Otherwise, a vector containing the rows of \code{X} that make up the initial subsample.}        
  \item{initial.subsample.size}{Integer giving the size of the initial subsample. 
                                Only effective if \code{initial.subsample="random"}. 
                                By default \code{initial.subsample.size} equals the minimum of the number of restscore groups over all items multiplied by the number of items.
                                If \code{initial.subsample} is not \code{"random"}, the size of the initial subsample equals the length of the vector provided at \code{initial.subsample}.} 
  \item{minsize}{Integer giving the minimum size of a rest score group. By default
        \code{minsize} = \eqn{N/10} if \eqn{N \ge 500};
        \code{minsize} = \eqn{N/5} if \eqn{250 \le N < 500}; and
        \code{minsize} = max\eqn{(N/3,50)} if \eqn{N < 250}}      
  \item{seed}{Numeric; fixes the random number generation \code{set.seed} in order to control the initial subsample. 
              Default is a randomly drawn value between 1 and 10000.}
  \item{n.low}{Numeric; \eqn{n2} should be larger than \code{n.low}. Default \code{n.low} = N/4.}
  \item{verbose}{Logical, indicating whether the subsample size should be printed on the screen. If \code{FALSE}, no output is produced. The default is \code{TRUE}.}        
}

\details{
Function \code{fs.MSA} computes the required input for forward plots (\code{\link{plot.fs.class}}).
Therefore, its values should be assigned to an object.
Function \code{fs.MSA} may take a long time for data if the number of items and/or observations is large.
A large \code{initial.subsample.size} reduces the computation time but may affect the results.
}

\value{
 Object of class \code{fs.class} containing the required input for forward plots (\code{\link{plot.fs.class}}).
 Only few of the items are of direct interest:\cr
 \code{initial.subsample.size}. Shows \eqn{n0}.\cr
 \code{n2}. Shows \eqn{n2}.\cr
  \code{suspect}. Shows the suspect observations.\cr
 \code{order.objective.function}. Shows the observations in descending order of their objective function values, for each subsample.
                                  Hence, the element row 1 and column 189 is the most suspect observation given the subsample of size 189.
}

\references{
  Zijlstra, W. P., Van der Ark, L. A., and Sijtsma, K. (2011).
  Robust Mokken scale analysis by means of the forward search algorithm for outlier detection.
   \emph{Multivariate Behavioral Research, 46}, 58-89.
  
  Van der Ark, L. A. (2007). 
  Mokken scale analysis in \pkg{R}. 
  \emph{Journal of Statistical Software}.
  \url{http://www.jstatsoft.org}
 }

\author{
 W. P. Zijlstra \email{w.p.zijlstra@uvt.nl}
}

\seealso{
\code{\link{fs.MSA.n1}}, \code{\link{plot.fs.class}}, \code{\link{plot.fs.n1.class}}
}                                    

\examples{
# Retrieve data (588 observations)
  data(acs)

# Run Forward Search for Mokken scale analysis starting with
# 550 observations in the initial subsample size to save time
  fwdmsa.res <- fs.MSA(acs, initial.subsample.size=550)

# Plot the objective function
  plot(fwdmsa.res, xlim = c(540,588))

# Plot the objective function for observations 1, 2, and 4
  plot(fwdmsa.res, id.observation = c(1,2,4), add=TRUE, col=2, xlim = c(540,588))

# Gap plot for subsamples 570 through 588
  plot(fwdmsa.res, type = "gap", ylim = c(0,4), xlim = c(570,588))

# Follow-up plots
  plot(fwdmsa.res, type="followup", step=560:565, reference.step=560, xlim = c(540,588))

# Min-excl plot.
  plot(fwdmsa.res, type = "minexcl", n2=TRUE, xlim=c(540,588))

# Plot of number of scales
  plot(fwdmsa.res, type="num.scale", n2=TRUE, xlim=c(540,588))

# Item entry plot for the longest scale
  plot(fwdmsa.res, type="scale", id.scale=1, n2=TRUE, xlim=c(540,588))

# Plot of estimated IRF of item 1
  plot(fwdmsa.res, type="IRF", items=1, n2=TRUE, xlim=c(540,588))

# Plot of coefH
  plot(fwdmsa.res, type="coefH", n2=TRUE, ylim=c(.1,.8), xlim=c(540,588))
}
\keyword{univar}
