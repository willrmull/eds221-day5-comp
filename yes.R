library(tidyverse)

leslie_matrix <- matrix(c(0, 0, 0, 200, 0.05, 0, 0, 0, 0, 0.10, 0, 0, 0, 0, 0.16, 0.9), nrow = 4, ncol = 4, byrow = TRUE)

leslie_year_initial <- c(5000, 8000, 600, 400)

time_yr <- seq(from = 0, to = 8, by = 1)
projection_year <- matrix(ncol = length(leslie_year_initial), nrow = length(time_yr))

#Insert values of first year into the matrix
projection_year[1, ] <- fish_year0

for(i in 2:length(time_yr)){
  
#Use dot product to estimate future population.
  
#Multiply the value in th eleslie matrix by the previous year population
  projection_year[i, ] <- leslie_matrix %*% projection_year[i-1, ]
}

#Chnage column names to the appropriate life stage
colnames(projection_year) <- c("eggs", "fry", "juvenile", "adult") 


#Create df with time year and different life stage values
rid of columns other than the time year
proj_df <- data.frame(time_yr, proj_year) %>% 
#Pivot converts all of the columns other than time into rows. Stores values in new column stage population and classification in lifestage columns.
  pivot_longer(cols = -time_yr, names_to = "lifestage", values_to = "stage_population")
proj_df
data.frame(time_yr, proj_year)

ggplot(data = proj_df, aes(x = time_yr, y = stage_population)) +
  geom_line(aes(color = lifestage)) +
  scale_y_log10()


