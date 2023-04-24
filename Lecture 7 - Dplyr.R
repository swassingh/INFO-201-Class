library("dplyr")

# Read in the female baby names data file into a variable called `names`
names_df <- read.csv("female_names.csv")

# Create a data frame `names_2013` that contains only the rows for the year 2013
names_2013 <- filter(names_df, year == 2013)

# What was the most popular female name in 2013?
most_popular_name_2013 <- pull(select(filter(names_2013, 
                                             prop == max(select(names_2013, prop))),name))
                        # pull(dataframe)
                        # [ "Sophia" ] becomes "Sophia"

# write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year
most_popular_in_year <- function(yr) {
  mpn_yr <- pull(select(filter(filter(names_df, year == yr), 
                     prop == max(select(filter(names_df, year == yr), prop))), name))
  return(mpn_yr)
}

# Write a function `number_per_year` that takes in a name and a year, and 
# returns how many babies born that year have that name.
number_per_year <- function(name_given, yr) {
  filt_name_by_year <- filter(names_df, name == name_given)
  filt_name_yr <- filter(filt_name_by_year, year == yr)
  ans <- pull(select(filt_name_yr, prop))
  return(ans)
}

