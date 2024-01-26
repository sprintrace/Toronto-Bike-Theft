
## this is a the not testing stuff

## lets go back to the original DATA??

# Select variables that start with "neighbourhood" or "thefts"
 
library(tidyr)
library(tidyverse)

selected_vars <- data %>% ##change to biketheftdata if I can fix CSV
  select(matches("^Biketheft_[0-9]"), AREA_NAME,)

selected_vars = as.data.frame(selected_vars)## code to drop geometry variable
##selected_vars = selected_vars %>% select(-geometry)
# Display the selected variables
glimpse(selected_vars)

## new code Bastion got this to resolve the issue with the render

### original code was if ("geometry" %in% colnames(selected_vars)) {
  selected_vars <- selected_vars[, !colnames(selected_vars) %in% "geometry"]
  print("Geometry column removed.")



# Reshape data from wide to long format
long_format_data <- selected_vars %>%
  pivot_longer(cols = -c(AREA_NAME),
               names_to = "variable",
               values_to = "value") %>%
  mutate(year = extract_numeric(variable))|>select(-variable)
# Display long format data with only the year
glimpse(long_format_data)


# Display long format data
glimpse(long_format_data)

## Using Gplot to create the actual table. 

library(ggplot2)

# Assuming long_format_data is your data frame in long format with columns 'year', 'value', and 'AREA_NAME'

# Create an empty list to store individual ggplot objects


## narrow down to 10 areas

area_list<- c("Yonge-Bay Corridor", "Annex", "University", "Kensington-Chinatown
", "Downtown Yonge East", "Danforth", "The Beaches
", "East End-Danforth", "Danforth East York
", "Woodbine Corridor")

## urban list

urban_list<- c("Yonge-Bay Corridor", "Annex", "University", "Kensington-Chinatown", "Downtown Yonge East")

# area_data[area %in% urban_list, ] ## restricting to only look at URBAN AREAS

area_data1 <- filter(long_format_data, AREA_NAME %in% urban_list)

plot <- ggplot(area_data1, aes(x = year, y = value, color = AREA_NAME)) +
  geom_line()

plot

## suburban 

suburban_list<- c("Danforth", "The Beaches", "East End-Danforth", "Danforth East York", "Woodbine Corridor")

# area_data[area %in% urban_list, ] ## restricting to only look at URBAN AREAS

area_data2 <- filter(long_format_data, AREA_NAME %in% suburban_list)

plot <- ggplot(area_data2, aes(x = year, y = value, color = AREA_NAME)) +
  geom_line()

plot

