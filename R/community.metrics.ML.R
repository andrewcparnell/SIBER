#' Calculate the point estimates of the Layman metrics for each community
#' 
#' This function loops over each community, determines the centre of mass 
#' (centroid) of each of the groups comprising the community using the basic 
#' \code{\link[base]{mean}} function independently on the marginal x and y vectors,
#' and calculates the corresponding 6 Layman metrics based on these points.
#' 
#' @param siber a siber object as created by create.siber.object.R
#' 
#' @return A 6 x m matrix of the 6 Layman metrics of dX_range, dY_range, TA, 
#' CD, MNND and SDNND in rows, for each community by column
#' 
#' @examples
#' data(demo.siber.data)
#' my.siber.data <- create.siber.object(demo.siber.data)
#' community.metrics.ML(my.siber.data)
#' 
#'  @export

community.metrics.ML <- function(siber) {
  
  out <- matrix(NA, nrow = 6,  ncol = siber$n.communities,
                dimnames = list(c("dY_range", "dX_range",
                                  "TA", "CD", "MNND", "SDNND"), 
                                paste("community", 
                                      1:siber$n.communities, sep = "")
                                )
                )
  
  for (i in 1:siber$n.communities){
    
    tmp <- laymanmetrics(siber$ML.mu[[i]][1,1,] ,
                  siber$ML.mu[[i]][1,2,])
    
      
  out[,i] <- tmp$metrics
  }
  
  return(out)
  
}
  

