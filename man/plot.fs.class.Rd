\name{plot.fs.class}
\alias{plot.fs.class}

\title{
Plot fs.class objects
}

\description{
 S3 Method to \code{plot} objects of class fs.class.
 Graphic display of the robust Mokken scale analysis by means of the Forward Search. 
 Seven different plots can be obtained.
}
\usage{
\method{plot}{fs.class}(
 x, 
 type = "objective", 
 observations = all.observations, 
 id.observation = FALSE, 
 items = all.items, 
 id.item = FALSE, 
 step = default.step, 
 reference.step = default.reference.step,
 id.scale = default.scale,
 tukey.fences = TRUE,
 add = FALSE,
 n0 = FALSE,
 n1 = FALSE,
 n2 = FALSE, 
 lower.c = default.lower.c, 
 col = default.col, 
 lwd = default.lwd, 
 lty = default.lty, 
 ylim = default.ylim, 
 xlim = default.xlim,
 ...)
}

\arguments{
  \item{x}{Object of \code{class fs.class} produced by \code{\link{fs.MSA}}.}
  \item{type}{Type of forward plot:\cr
    \code{"objective"} (default): Forward plot showing the objective function for an observation over all subsample sizes.\cr
    \code{"minexcl"}: Forward plot of the minimum objective function values of the observations exluded from the sample.\cr 
    \code{"maxincl"}: Forward plot of the maximum objective function values of the observations included in the sample.\cr 
    \code{"gap"}: Forward plot of the \code{minexcl}-\code{maxincl}.\cr     
    \code{"coefH"}: Forward plot of Loevinger's scalability coefficient for items (\eqn{Hj}) and the test (\eqn{H}).\cr 
    \code{"restscore"}: One graph for each item plotting the estimated expected item response functions.\cr 
    \code{"IRF"}: Forward plot of the estimated expected item response functions.\cr
    \code{"followup"}: Forward plot of the observations entering and leaving the subsample at a specified step. 
                         The identitty of the obervations entering or leavind the subsample is provided in the plot.\cr
    \code{"scale"}: Forward plot showing whether the selected \code{items} belong to a scale.\cr
    \code{"num.scale"}: Forward plot of the number of scales found by the AISP.}
  \item{observations}{Vector containing the observations to show. The default uses all observations.\cr 
                 Relevant for \code{type="objective"}.}
  \item{id.observation}{Vector containing the observation(s) for which the results are plotted in a different color 
                   and the identity of the observation(s) is added to the plot.\cr 
                   Relevant for \code{type="objective"}.}
  \item{items}{Vector containing the items for which the results are plotted.
              Default the results for all items are depicted.\cr
              Relevant for \code{type="coefH"}, \code{type="restscore"}, \code{type="IRF"}, and \code{type="scale"}.}
  \item{id.item}{Logical, if \code{TRUE} the identity of the items are added to the plot.\cr 
                 Relevant for \code{type="coefH"}.}
  \item{step}{Single number or vector containing the subsample size.
              Default is sample size \eqn{N}.\cr
              For \code{type="restscore"} \code{step} is a single number.\cr
              For \code{type="individual"} \code{step} may be a vector.\cr
              Relevant for \code{type="restscore"} and \code{type="individual"}.}
  \item{reference.step}{Single number containing the subsample size. 
              Default is \code{step}-1.\cr
              Relevant for \code{type="individual"}.}
  \item{id.scale}{Numeric indicating which scale to show; \code{id.scale}=0 indicates unscalable items, 
                                                          \code{id.scale}=1 indicates the longest scale,
                                                          \code{id.scale}=2 indicates the next longest scale, etc.
                                                          Default shows all scales.\cr
                                                          Relevant for \code{type="scale"}.}
  \item{tukey.fences}{Logical, if \code{TRUE} Tukey's Fences (Q3 + 1.5 * IQR and Q3 + 3 * IQR) are plotted.\cr
                 Relevant for \code{type="minexcl"}.}
  \item{add}{Logical, if \code{TRUE}, the plot is added to the current plot. 
             The default is \code{FALSE}.\cr 
             Relevant for \code{type="objective"}, \code{type="minexcl"}, \code{type="maxincl"}, \code{type="gap"}, \code{type="coefH"}, and \code{type="restscore"}.}
  \item{n0}{Logical, indicating whether \eqn{n0} should be added to the plots. Default is \code{FALSE}}
  \item{n1}{Default is \code{FALSE} otherwise a single number should be given}
  \item{n2}{Logical, indicating whether \eqn{n2} should be added to the plots. Default is \code{FALSE}}
  \item{lower.c}{Numeric scaling criterium; 0 <= \code{lowerbound} < 1. 
                 The default is \code{0.3}.}
  \item{col}{Colour to be used for the lines.}
  \item{lwd}{Line width}
  \item{lty}{Line type}
  \item{ylim, xlim}{Range of \code{x} and \code{y} values with sensible defaults.}
  \item{...}{Other arguments are ignored.}
}
\details{
\code{add=TRUE} for \code{type="restscore"} can only be used for one item (e.g., \code{items=1}). 
}

\value{
 Returns a graph.
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
\code{\link{fs.MSA}}, \code{\link{fs.MSA.n1}}, \code{\link{plot.fs.n1.class}}
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
\keyword{aplot}
