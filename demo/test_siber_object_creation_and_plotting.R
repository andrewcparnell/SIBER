# test script for the main SIBER functionality

rm(list=ls())
graphics.off()


# this script itself sources the functions needed
source("demo/tmp.source.these.R")

# read in the example dataset
mydata <- read.csv("data/demo.siber.data.csv", header=T)

# create the siber object
siber.example <- create.siber.object(mydata) 


# ==============================================================================
# PLotting the raw data
# ==============================================================================
# and now call the basic graph making script
# Community 1 comprises 3 groups and drawn as black, red and green circles
# community 2 comprises 3 groups and drawn as black, red and green triangles
#
# ax.pad determines the padding applied around the extremes of the data.
#
# iso.order is a vector of length 2 specifying which isotope should be
#  plotted on the x and y axes.
#  N.B. though there is currently a problem with the addition of the
#  group ellipses using if you deviate from the default of 
#  iso.order = c(1,2). This needs to be fixed.
#
# Convex hulls are drawn between the centres of each group within a community
#   with hulls = T.
#
# Ellipses are drawn for each group independently
#  with ellipses = T.
#  These ellipses can be made to be maximum likelihood standard ellipses
#  by setting p = NULL, or can be made to be predicition ellipses that
#  contain approximately p proportion of data. For example, p = 0.95
#  will draw an ellipse that encompasses approximately 95% of the data.
#  The parameter n determines how many points are used to make each ellipse
#  and hence how smooth the curves are.
#
# Convex hulls are draw around each group independently
# with group.hulls = T.

# Create lists of plotting arguments to be passed onwards to each 
# of the three plotting functions.
community.hulls.args <- list(col = 1, lty = 1, lwd = 1)
group.ellipses.args  <- list(n = 100, p.interval = 0.95, lty = 1, lwd = 2)
group.hull.args      <- list(lty = 2, col = "grey20")



par(mfrow=c(1,1))
plot.siber.object(siber.example,
                  ax.pad = 2, 
                  hulls = F, community.hulls.args, 
                  ellipses = T, group.ellipses.args,
                  group.hulls = T, group.hull.args,
                  bty = "L",
                  iso.order = c(1,2),
                  xlab = expression(paste(delta^{13}, C , "‰", sep="")),
                  ylab = expression(paste(delta^{15}, N , "‰", sep=""))
                  )

# ==============================================================================
# Some basic Maximum Likelihood analyses
# ==============================================================================

# Calculate sumamry statistics for each group: TA, SEA and SEAc
# These are just the point estimates for now, the Bayesian estimates will 
# follow.This approach is used to make comparisons among the components of 
# communities (i.e. groups), wither within or among communities. It is
# similar to the analysis applied in [REF].
group.ML <- group.metrics.ML(siber.example)

# You can add more ellipses by directly calling plot.group.ellipses()
# In this case, with p=NULL we get the standard ellipse.
plot.group.ellipses(siber.example, p.interval = NULL, lty = 1)

# Add an additional p.interval % prediction ellilpse
#plot.group.ellipses(siber.example, n = 100, p.interval = 0.95,
#                    lty = 1, lwd = 2)

# or you can add the XX% confidence interval around the bivariate means
# by specifying ci.mean = T along with whatever p.interval you want.
plot.group.ellipses(siber.example, n = 100, p.interval = 0.95, ci.mean = T,
                    lty = 2, lwd = 2)

print(group.ML)

# ------------------------------------------------------------------------------
# Calculate the various Layman metrics on each of the communities.
# These are just the point estimates for now, the Bayesian estimates will 
# follow. This approach is used to make comparisons between or among communities
# and uses the approach described in [REF]
community.ML <- community.metrics.ML(siber.example) 

print(community.ML)


# ==============================================================================
# Fit Bayesian Ellipses to each of the groups.
# SEA_B and the layman-metrics can be estimated afterwards.
# ==============================================================================

# ------------------------------------------------------------------------------
# Fit JAGS IW prior
# ------------------------------------------------------------------------------
# # fit same Inverse Wishart (IW) model using JAGS
# parms <- list()
# parms$n.iter <- 2 * 10^4   # number of iterations to run the model for
# parms$n.burnin <- 1 * 10^4 # discard the first set of values
# parms$n.thin <- 10         # thin the posterior by this many
# parms$n.chains <- 2        # run this many chains
# 
# 
# priors <- list()
# priors$R <- 1 * diag(2)
# priors$k <- 2
# priors$tau.mu <- 1.0E-3
# 
# # some test code: extract one of the group's data
# xx <- siber.example[[1]][,1]
# yy <- siber.example[[1]][,2]
# gg <- siber.example[[1]][,3]
# 
# # fit the ellipses using the Inverse Wishart JAGS method.
# ellipses.posterior <- bayesian.ellipses(xx, yy,
#                                         gg, method="IWJAGS", 
#                                         parms, priors)






