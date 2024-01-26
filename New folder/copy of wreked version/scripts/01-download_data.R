library(opendatatoronto)
library(dplyr)
library(tidyverse)
library(sf)
library(here)

# get package
package <- show_package("neighbourhood-crime-rates")
package

# get all resources for this package
resources <- list_package_resources("neighbourhood-crime-rates")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) |> get_resource()
data<-dplyr::select(as.data.frame(data),-geometry)## = take everything but the spacial component. we removed the geometry. 

#write.csv(data, "/input/data.csv", row.names=FALSE) ## save to CSV format

write.csv (data,here::here("inputs/data/data.csv"), row.names=FALSE)

