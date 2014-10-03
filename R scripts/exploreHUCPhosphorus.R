library(dataRetrieval)
library(dplyr)
library(USGSHydroTools)

data <- getWQPData(huc="0410*", characteristicName="Phosphorus")

sites <-  getWQPSites(huc="0410*", characteristicName="Phosphorus")

data_bySite <- group_by(data, MonitoringLocationIdentifier)
summarize <-  summarise(data_bySite,
                        Count = n(),
                        CountAfter2000 = sum(ActivityStartDateTime > 
                                               as.POSIXct("2000-01-01 00:00:00"),na.rm = TRUE),
                        MinDate = min(ActivityStartDateTime, na.rm = TRUE),
                        MaxDate = max(ActivityStartDateTime, na.rm = TRUE)) %.%
  arrange(desc(Count))  %.%
  filter(Count >= 50) %.%
  filter(CountAfter2000 >= 10)

sumStation <- merge(summarize, sites, by="MonitoringLocationIdentifier", all.x=TRUE)

latVar <- "LatitudeMeasure"
lonVar <- "LongitudeMeasure" 

mainTitle <- "All sites measuring Phosphorous"

xmin <- min(sumStation[,lonVar],na.rm = TRUE)-3
xmax <- max(sumStation[,lonVar],na.rm = TRUE)+1
ymin <- min(sumStation[,latVar],na.rm = TRUE)-.5
ymax <- max(sumStation[,latVar],na.rm = TRUE)+.5

#legend upper left corner:
xleft <- xmin + 0.2
ytop <- 0.85*(ymax-ymin) + ymin

MapLocations(sites,latVar,lonVar,
             xmin,xmax,ymin,ymax,mainTitle=mainTitle,
             includeLabels=FALSE)