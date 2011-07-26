\name{fwdmsa-package}
\alias{fwdmsa-package}
\alias{fwdmsa}
\docType{package}

\title{
Robust Mokken Scale Analysis by Means of the Forward Search Algorithm for Outlier Detection
}
\description{
The package conducts the Forward Search on test and questionnaire data, and shows forward plots for the detection of outliers.
}
\details{
\tabular{ll}{
Package: \tab fwdmsa\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2011-07-26\cr
License: \tab GPL Version 2 or later\cr
}
The package includes the functions
\tabular{ll}{
\code{\link{fs.MSA}}                \tab Computes the necessary input for forward plots\cr
\code{\link{plot.fs.class}}         \tab S3 method for forward plots \cr
\code{\link{fs.MSA.n1}}             \tab Computes \eqn{n1}\cr
\code{\link{plot.fs.n1.class}}      \tab S3 method for a plot showing graphically \eqn{n1}\cr
}
and data set
\tabular{ll}{
\code{\link{acs}}                \tab Autonomy-Connectedness Scale\cr
}

Thanks are due 
 to L. Andries van der Ark for contributing R code, and Marrie Bekker and Marcel van Assen for providing the data set.
}

\author{
Wobbe P. Zijlstra
Maintainer:  Wobbe P. Zijlstra <w.p.zijlstra@uvt.nl>. 
}

\references{

Bekker M. H. J., and Van Assen, M. A. L. M. (2006). 
A short form of the autonomy scale: Properties of the autonomy-connectedness scale (ACS-30).
\emph{Journal of Personality Assessment, 86}, 51-60.

Van der Ark, L. A. (2007). 
Mokken scale analysis in \pkg{R}. 
\emph{Journal of Statistical Software}.
\url{http://www.jstatsoft.org}

Zijlstra, W. P., Van der Ark, L. A., and Sijtsma, K. (2011).
Robust Mokken scale analysis by means of the forward search algorithm for outlier detection.
\emph{Multivariate Behavioral Research, 46}, 58-89.
 
}

\keyword{package}

\examples{

\dontrun{
## Analyses of Zijlstra et al. (2010).
## First Forward Search Analysis
   library(fwdmsa)
   data(acs.cont)

 # Determining n1 = 292
 # Takes approximately 40 minutes
   fs1.1.n1 <- fs.MSA.n1(acs.cont, B=100)
   n1 <- fs1.1.n1$n1 

 # Figure 2: Plot of number unique subsamples
   plot(fs1.1.n1)

 # Running the forward search
   fs1.1 <- fs.MSA(acs.cont)

 # Figure 3: Plot of objective function
   plot(fs1.1, type="objective", observations=1:618, col="gray70", n0=TRUE, n1=fs.res.cont.n1$n1, xlim=c(0,650))
   plot(fs1.1, type="objective", id.observation=619, col=1, lwd=2, lty=2, add=TRUE)
   plot(fs1.1, type="objective", observations=589:618, lwd=2, add=TRUE)

 # Figure 4: Gap plot
   plot(fs1.1, type="gap", ylim=c(-10,12), n0=TRUE, n1=292)

 # Figure 5: Follow-up plots
   plot(fs1.1, type="followup", step=543:548, reference.step=543, n0=TRUE, n1=292)

## Remove influential observations from the data
   acs.sus <- acs.cont[-(589:618),]
 
 # Determining n1 = 296
   fs1.2.n1 <- fs.MSA.n1(acs.sus, B=100)
   n1 <- fs1.2.n1$n1 

 # Running the forward search
   fs1.2 <- fs.MSA(acs.sus)

 # Figure 6: Minexcl plot
   plot(fs1.2, type="minexcl", n0=TRUE, n1=296, n2=TRUE)

 # Figure 7: Plot of number of scales
   plot(fs1.2, type="num.scale", n0=TRUE, n1=296, n2=TRUE)

 # Figure 8: Item entry plot for the longest scale
   plot(fs1.2, type="scale", id.scale=1, n0=TRUE, n1=296, n2=TRUE)

## Second Forward Search Analysis
 # Remove bad items from the data
   acs.min.core <- acs.cont[-(589:618),-c(3,7,8,11,13,16)]
 
 # Determining n1 = 302
   fs2.n1 <- fs.MSA.n1(acs.min.core, B=100)
   n1 <- fs2.1.n1$n1 

 # Running the forward search
   fs2 <- fs.MSA(acs.min.core)

 # Figure 9: Plot of restscore regression of item 1 for steps 302 and 589
   plot(fs2, type="restscore", step=302, items=1, lty=2, ylim=c(0,4), n0=TRUE, n1=302, n2=TRUE)
   plot(fs2, type="restscore", step=589, items=1, lty=1, add=TRUE)

 # Figure 10: Plot of estimated IRF of item 1
   plot(fs2, type="IRF", items=1, n0=TRUE, n1=302, n2=TRUE)

 # Figure 11: Plot of coefH
   plot(fs2, type="coefH", n0=TRUE, n1=302, n2=TRUE, ylim=c(.1,.8))

## What if influential observations were not removed from the data
   acs.cont.core <- acs.cont[,-c(3,7,8,11,13,16)]
 # Determining n1 = 347
   fs3.n1 <- fs.MSA.n1(acs.cont.core, B=100)
   n1 <- fs3.n1$n1 

 # Running the forward search
   fs3 <- fs.MSA(acs.cont.core)

 # Figure 12a: Plot of estimated IRF of item 1 with influential observations
   plot(fs3, type="IRF", items=1, n0=TRUE, n1=347, n2=FALSE)

 # Figure 12b: Plot of coefH with influential observations
   plot(fs3, type="coefH", n0=TRUE, n1=347, n2=FALSE, ylim=c(.1,.8))
}                                                           
}
