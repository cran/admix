% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/admix_test.R
\name{summary.admix_test}
\alias{summary.admix_test}
\title{Summary method for 'admix_test' objects}
\usage{
\method{summary}{admix_test}(object, ...)
}
\arguments{
\item{object}{An object of class 'admix_test' (see ?admix_test).}

\item{...}{further arguments passed to or from other methods.}
}
\description{
Print the decision (as well as other useful information) of the statistical test with null hypothesis corresponding to
the equality of unknown component distributions in admixture models. More precisely, given two (or more) admixture models
with cumulative distribution functions (CDF) L1 and L2, where Li = pi*Fi + (1-pi)*Gi i=1,2 and Gi are the known CDFs, the
function performs the test: H0: F1 = F2 versus H1: F1 != F2.
}
\author{
Xavier Milhaud \href{mailto:xavier.milhaud.research@gmail.com}{xavier.milhaud.research@gmail.com}
}
