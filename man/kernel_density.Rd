% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kernel_density.R
\name{kernel_density}
\alias{kernel_density}
\title{Kernel estimation}
\usage{
kernel_density(u, h)
}
\arguments{
\item{u}{the point at which the estimation is made.}

\item{h}{window of the kernel estimation.}
}
\value{
the estimated value of the pdf.
}
\description{
Functions to perform the estimation of probability density function (pdf) by kernel estimators (with a non-gaussian kernel).
}
\examples{
kernel_density(0.4,0.5)

}
\author{
Xavier Milhaud \href{mailto:xavier.milhaud.research@gmail.com}{xavier.milhaud.research@gmail.com}
}
