library(dataRetrieval)
library(dplyr)
library(USGSHydroTools)

data <- getWQPData(huc="0410*")

sites <-  getWQPSites(huc="0410*")


orggroup <- unique(sites$OrganizationFormalName)
count <- length(orggroup)
sitebyorg <- group_by(sites,OrganizationFormalName) %>%
  summarize(count = n()) %>% 
  arrange(desc(count))

latVar <- "LatitudeMeasure"
lonVar <- "LongitudeMeasure" 

mainTitle <- "All sites by organization"

xmin <- min(sites[,lonVar],na.rm = TRUE)-3
xmax <- max(sites[,lonVar],na.rm = TRUE)+1
ymin <- min(sites[,latVar],na.rm = TRUE)-.5
ymax <- max(sites[,latVar],na.rm = TRUE)+.5

#legend upper left corner:
xleft <- xmin + 0.2
ytop <- 0.85*(ymax-ymin) + ymin

MapLocations(sites,latVar,lonVar,
             xmin,xmax,ymin,ymax,mainTitle=mainTitle,
             includeLabels=FALSE)

sites$org <- as.factor(sites$OrganizationFormalName)


MapSizeColor(sites,"org",NA,latVar,lonVar,NA,1:16,xmin,xmax,ymin,ymax,xleft,ytop)


write.csv(sitebyorg,file="orgs.csv",row.names = FALSE)




