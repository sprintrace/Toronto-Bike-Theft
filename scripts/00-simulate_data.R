## simulation of data number of thefts, years, and neigbourhoods ## 
## simulating what the proccess will be like when we use real data that we import. 
##this provides a rough structure to our project, but NOT the actual structure for columbs 

## {SELF NOTE} set number of years to be variables instead of static numbers{SELF NOTE} set number of years to be variables instead of static numbers - see year line of code

library(tidyverse) 

##set seed
set.seed(613)

##we want to simulate year, neighbourhood, and number of bike thefts
##based on 2.4 in textbook
simulated_theft_data <-
  tibble(
    neighbourhood =
      c(rep("A", 10), ## number (10) = number of years of data
        rep("B", 10), 
        rep("C", 10)), ## sample neigbourhoods
    year = ##                                   {SELF NOTE} set number of years to be variables instead of static numbers
      rep(c(2014:2023 ), 3), ## years (2014:2023 = 10 year period of time) (3 = repeat code 3) 
    thefts =
      runif(n = 30, min = 10, max = 100) ## FIND A SOURCE FOR HOW MANY THEFTS. MIN IS 1, MAX IS 100, 
  )

head(simulated_theft_data)

## test to see if we are getting desired results in our tests to see if the code alignes with the variables created.


simulated_theft_data$neighbourhood |> ## change name of variable
  unique() == c("A", "B", "C") ## test to see if a,b, or c are recognized in R as neigbourhoods

simulated_theft_data$neighbourhood |> ## testing that a,b, and c are in the neigbourhood variable??
  unique() |>
  length() == 3

simulated_theft_data$year |> min() == 2014 ## is 2014 the minimum year within the simulated data
simulated_theft_data$year |> max() == 2023 ## is 2023 the maximum year within the simulated data
simulated_theft_data$thefts |> min() >= 10 ## is minimum thefts 10 within the simulated data
simulated_theft_data$thefts |> max() <=100 ## is minimum thefts 10 within the simulated data
simulated_theft_data$thefts |> class() == "numeric" ## testing that the result is a number instead of a text or other output. 

##

