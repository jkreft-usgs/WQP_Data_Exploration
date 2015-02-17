library(dataRetrieval)
library(dplyr)
library(USGSHydroTools)

# data <- getWQPData(huc="0410*")

sites <-  whatWQPsites(huc="0410*", characteristicType="Nutrient" )


orggroup <- unique(sites$OrganizationFormalName)
count <- length(orggroup)
sitebyorg <- group_by(sites,OrganizationFormalName) %>%
  summarize(count = n()) #%>% 
  #arrange(desc(count))

latVar <- "LatitudeMeasure"
lonVar <- "LongitudeMeasure" 

mainTitle <- "All sites by organization"

xmin <- min(sites[,lonVar],na.rm = TRUE)-3
xmax <- max(sites[,lonVar],na.rm = TRUE)+1
ymin <- min(sites[,latVar],na.rm = TRUE)-.5
ymax <- max(sites[,latVar],na.rm = TRUE)+.5

MapLocations(sites,latVar,lonVar,
             xmin,xmax,ymin,ymax,mainTitle=mainTitle,
             includeLabels=FALSE)

#legend upper left corner:
xleft <- xmin + 0.2
ytop <- 0.85*(ymax-ymin) + ymin

mainTitle <- "All sites by organization"
xmin <- min(sites[,lonVar],na.rm = TRUE)-.5
xmax <- max(sites[,lonVar],na.rm = TRUE)+.5
ymin <- min(sites[,latVar],na.rm = TRUE)-.5
ymax <- max(sites[,latVar],na.rm = TRUE)+.5

#legend upper left corner:
xleft <- xmax+.1#xmin + 0.5*(xmax-xmin)
ytop <- ymax#(ymax-ymin)*.85 + ymin

# MapLocations(sites,latVar,lonVar,
#              xmin,xmax,ymin,ymax,mainTitle=mainTitle,
#              includeLabels=FALSE)

# colors <- colorRampPalette(c("white","red"))(count)
colors <- rainbow(count)
colors[1] <- "white"
sitelist <- unique(sites$OrganizationFormalName) 
# site  order(OrganizationFormalName)

colThresh <- 1:length(sitelist)

MapSizeColor(sites,"OrganizationFormalName",NA,latVar,lonVar,
             sizeThresh=NA,colThresh=colThresh,
             colVector=colors,colBinText=sitelist,
             colText = "Agencies",
             xmin,xmax,ymin,ymax,xleft,ytop,
             LegCex=0.75)

write.csv(sitebyorg,file="orgs.csv",row.names = FALSE)




