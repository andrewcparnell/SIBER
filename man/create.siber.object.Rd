% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/create.siber.object.R
\name{create.siber.object}
\alias{create.siber.object}
\title{Read in SIBER format data and generate the SIBER object}
\usage{
create.siber.object(data.in)
}
\arguments{
\item{data.in}{a basic R data.frame or matrix comprising four columns.
The first two of which are typically isotope tracers, then the third is a
column that indicates the group membership, and the fourth column indicates
the community membership of an observation. Group and communities should be
entered  as sequetial numbers, and groups numbering should restart within a
community}
}
\value{
A siber list object, that contains data that helps with various
model fitting and plotting.
\itemize{
  \item {original.data}{The original data as passed into this function}
  \item {iso.summary}{The max, min, mean and median of the isotope data
  useful for plotting}
  \item {sample.sizees}{The number of obsevations tabulated by group and
  community}
  \item {raw.data}{A list object of length equal to the number of communities}
}
#'
}
\description{
Read in SIBER format data and generate the SIBER object
}
\examples{
data(demo.siber.data)
mydata <- create.siber.object(demo.siber.data)
names(mydata)
}
