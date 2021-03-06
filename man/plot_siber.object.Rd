% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/plot_siber.object.R
\name{plot_siber.object}
\alias{plot_siber.object}
\title{Creates an isotope biplot and provides a wrapper to ellipse and hull plotting}
\usage{
plot_siber.object(siber, iso.order = c(1, 2), ax.pad = 1, hulls = TRUE,
  community.hulls.args = NULL, ellipses = TRUE,
  group.ellipses.args = NULL, group.hulls = FALSE,
  group.hulls.args = NULL, bty = "L", xlab = "Isotope 1",
  ylab = "Isotope 2", las = 1, ...)
}
\arguments{
\item{siber}{a siber object as created by \code{\link{create.siber.object}}.}

\item{iso.order}{a vector of length 2, either c(1,2) or c(2,1). The order
determines which of the columns of raw data are plotted on the x (1) or y
(2) axis. N.B. this will be deprecated in a future release, and plotting
order will be acheived at point of data-entry.}

\item{ax.pad}{a padding amount to apply to the x-axis either side of the
extremes of the data. Defaults to 1.}

\item{hulls}{a logical defaulting to TRUE determining whether or not hulls
based on the means of groups within communities should be drawn. That is, a
community-level convex hull.}

\item{community.hulls.args}{a list of plotting arguments to pass to
\code{\link{plot_community.hulls}}. See \code{\link{plot_community.hulls}}
for further details.}

\item{ellipses}{a logical defaulting to TRUE determining whether or not an
ellipse should be drawn around each group within each community.}

\item{group.ellipses.args}{a list of plotting arguments to pass to
\code{\link{plot_group.ellipses}}. See \code{\link{plot_group.ellipses}} for
further details.}

\item{group.hulls}{a logical defaulting to FALSE determining whether or not
convex hulls should be drawn around each group within each community.}

\item{group.hulls.args}{a list of plotting options to pass to
\code{\link{plot_group.hulls}}. See \code{\link{plot_group.hulls}} for
further details.}

\item{bty}{a string specifying the box type for the plot. See
\code{\link[graphics]{par}} for details.}

\item{xlab}{a string for the x-axis label.}

\item{ylab}{a string for the y-axis label.}

\item{las}{a scalar determining the rotation of the y-axis labels. Defaults
to horizontal with \code{las = 1}. See \code{\link[graphics]{par}} for more
details.}

\item{...}{additional arguments to be passed to \code{\link[graphics]{plot}}.}
}
\value{
An isotope biplot.
}
\description{
This function takes a SIBER object as created by
\code{\link{create.siber.object}}, and loops over communities and their
groups, creating a biplot, and adding ellipses and hulls as desired. Ellipses
can be added to groups, while convex hulls can be added at both the group
and community level (the former for illustrative purposes only, with no
analytical tools in SIBER to fit Bayesian hulls to individual groups. This is
not mathematically possible in a Bayesian framework.).
}

