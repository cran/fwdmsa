\name{acs}
\alias{acs}
\alias{acs.cont}
\docType{data}
\title{Autonomy-Connectedness Scale}

\description{
 \code{acs} are the scores of 588 students on 17 items from the Dutch version of the subscale ``sensitivity to others'' of the Autonomy-Connectedness Scale.\cr
 \code{acs.cont} are the \code{acs} data with additional 31 contaminants.
}
\usage{
data(acs) 
data(acs.cont)}

\format{
\code{acs} is a 588 by 17 matrix containing integers.\cr 
\code{acs.cont} is a 619 by 17 matrix containing integers. 
}
\details{
 Each item has five ordered answer categories 
 (0 = disagree, 1 = slightly disagree, 2 = agree nor disagree, 3 = slightly agree, 4 = agree).
 The items are shown in the table below. An \dQuote{N} indicates a negatively worded item. 
The scores on the negatively worded items were reversed.

\tabular{rlc}{
1. \tab Usually I can dismiss another person's misery from my mind \tab N \cr
2. \tab If I have things my own way against the will of others, I usually get very restless \tab \cr
3. \tab I hate detachment \tab \cr
4. \tab I am seldom occupied with the feelings and experiences of others \tab N \cr
5. \tab I easily put aside other people's comments \tab N \cr
6. \tab I am rarely occupied with other people's view of me \tab N \cr
7. \tab If I imagine myself having to say goodbye to a beloved person, I feel brokenhearted in advance \tab \cr
8. \tab I am seldom inclined to ask other people's advice \tab N \cr
9.  \tab I often go deeply into other people's feelings \tab \cr
10. \tab I often wonder what other people think of me \tab \cr
11. \tab When I take important decisions about my life, I leave other people's wishes and opinions out of consideration \tab N \cr
12. \tab I can hardly bear it when other people are angry with me \tab \cr
13. \tab Somebody else's experiences leave a strong mark on my own moods \tab \cr
14. \tab I feel a strong need for other people's advice and guidance \tab \cr
15. \tab If I do something that bothers other people, I can easily dismiss that from my mind \tab N \cr
16. \tab I often long for love and warmth \tab \cr
17. \tab I can easily back out of things that people who are important to me want me to do \tab N \cr
}}

\source{
 Data were kindly made available by M. H. J. Bekker and M. A. L. M. van Assen from the Tilburg University.
}

\references{
Bekker M. H. J., and Van Assen, M. A. L. M. (2006). 
A short form of the autonomy scale: Properties of the autonomy-connectedness scale (ACS-30).
\emph{Journal of Personality Assessment, 86}, 51-60.
}

\seealso{
\code{\link{fs.MSA}}, \code{\link{plot.fs.class}}, \code{\link{fs.MSA.n1}}, \code{\link{plot.fs.n1.class}}
}

\examples{
data(acs)
data(acs.cont)
}

\keyword{datasets}
