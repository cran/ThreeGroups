\name{ThreeG}
\alias{ThreeG}
\title{ML Estimator for Baseline-Placebo-Treatment (Three-Group) Experiments}
\description{This package implements the Maximum Likelihood estimator for baseline, placebo, and treatment groups (three-group) experiments with non-compliance proposed by Gerber, Green, Kaplan, and Kern (2010).}
\usage{
ThreeG(data, starting = NULL)
}


\arguments{
  \item{data}{a numeric vector or list of length 10, containing the data in the form of counts: \cr
  the number of successes (observations with \eqn{Y=1}) in the baseline group \kbd{(s_b)}, \cr
  the number of failures (observations with \eqn{Y=0}) in the baseline group \kbd{(f_b)}, \cr
  the number of successes in the treatment group among compliers \kbd{(s_t_c)}, \cr
  the number of failures in the treatment group among compliers \kbd{(f_t_c)}, \cr
  the number of successes in the treatment group among non-compliers \kbd{(s_t_nc)}, \cr
  the number of failures in the treatment group among non-compliers \kbd{(f_t_nc)}, \cr
  the number of successes in the placebo group among compliers \kbd{(s_p_c)}, \cr
  the number of failures in the placebo group among compliers \kbd{(f_p_c)}, \cr
  the number of successes in the placebo group among non-compliers \kbd{(s_p_nc)}, \cr
  the number of failures in the placebo group among non-compliers \kbd{(f_p_nc)}.}

  \item{starting}{a numeric vector of length 4, containing starting values for the 4 parameters to be estimated. If missing, suitable starting values are generated internally.}
}


\details{The data, whether given as a list or a numeric vector, must be sorted in the order given above, 
i.e., \kbd{(s_b)}, \kbd{(f_b)}, \dots , \kbd{(f_p_nc)}.\cr
In most cases there should be no need to specify starting values.\cr
Note that the notation used here is slightly different from that presented in section 3.3 of Gerber, Green, Kaplan, and Kern (2010).\cr

Please contact the maintainer of this package with questions related to this package and the corresponding author of the article (Alan Gerber, \email{alan.gerber@yale.edu}) with questions related to the article.
}


\value{
\code{ThreeG()} returns a list with the following components:
\item{starting}{contains the starting values used by \code{optim()}.}
\item{est}{a 4x2 matrix containing estimates (first column) and standard errors (second column) of the proportion of compliers (row 1), the probability of success given treatment for compliers (row 2), the probability of success for non-compliers (row 3), and the complier average treatment effect (row 4).}
\item{optim.out}{a list containing the output from \code{optim()}, including the Hessian.}
}


\references{Alan S. Gerber, Donald P. Green, Edward H. Kaplan, and Holger L. Kern. 2010. ``Baseline, placebo, and treatment: Efficient estimation for three-group experiments.'' \emph{Political Analysis} 18 (3): 297-315.}


\author{Holger L. Kern, \email{hkern@fsu.edu}, \url{http://www.holgerkern.com}}


\examples{
#
# This example replicates the empirical analysis presented in
# Gerber, Green, Kaplan, and Kern (2010), Table 5, first column.
#
# input data
sstat <- list(
s_b = 51766,
f_b = 253182,

s_t_c = 858,
f_t_c = 3128,

s_t_nc = 650,
f_t_nc = 3812,

s_p_c = 752,
f_p_c = 3154,

s_p_nc = 672,
f_p_nc = 3779)

#
# let's estimate the complier average treatment effect
#
out <- ThreeG(sstat)
}
