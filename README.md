WQP Data Exploration
====================

This gitHub repository will store information on tools to use the Water Quality Portal


###Package Installation
The `dataRetrieval` package is helpful for importing Water Quality Portal data into the R environment. The following command will install the latest stable release. 

    install.packages("dataRetrieval", 
  	  repos=c("http://usgs-r.github.com","http://cran.us.r-project.org"),
  	  dependencies=TRUE,
  	  type="both")
      
Alternatively, the 'in-development' version of `dataRetrieval` can be installed with the `devtools` package using the following command:

    library(devtools)
    install_github("USGS-R\dataRetrial")
    
    
See [https://github.com/USGS-R/dataRetrieval](https://github.com/USGS-R/dataRetrieval) for more information on `dataRetrieval`


The package `USGSHydroTools` is helpful for summarizing data, and simple map plotting. See [https://github.com/USGS-R/USGSHydroTools](https://github.com/USGS-R/USGSHydroTools) for more information on `USGSHydroTools`.
      
###Disclaimer
This software is in the public domain because it contains materials that originally came from the U.S. Geological Survey, an agency of the United States Department of Interior. For more information, see the [official USGS copyright policy](http://www.usgs.gov/visual-id/credit_usgs.html#copyright/ "official USGS copyright policy")

Although this software program has been used by the U.S. Geological Survey (USGS), no warranty, expressed or implied, is made by the USGS or the U.S. Government as to the accuracy and functioning of the program and related program material nor shall the fact of distribution constitute any such warranty, and no responsibility is assumed by the USGS in connection therewith.

This software is provided "AS IS."