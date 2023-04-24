# working with Vectors
library(stringr)

names_practce <- c("sara", "bob", "cathy", "alice")
# print(str_replace_all(names_practice,"a", "*"))

age_practice <- c(40, 50, 60, 75, 80)
# print(mean(age_practice))
# print(sd(age_practice))
# print(diff(age_practice))
# print(length(age_practice))

# Read in the female baby names data file into a variable called `names`
names_df <- read.csv("female_names.csv")

# Create a data frame `names_2013` that contains only the rows for the year 2013
names_2013 <- names_df[names_df$year == "2013",]

# What was the most popular female name in 2013?
most_popular_name_2013 <- max(names_2013$prop)
mpn_2013 <- names_2013[names_2013$prop == most_popular_name_2013, "name"]

# write a function `most_popular_in_year` that takes in a year as a value and 
# returns the most popular name in that year
most_popular_in_year <- function(year) {
  names_yr <- names_df[names_df$year == year,]
  most_popular_name_yr <- max(names_yr$prop)
  mpn_yr <- names_yr[names_yr$prop == most_popular_name_yr, "name"]
  return(mpn_yr)
}

# What was the most popular female name in 1994?
names_1994 <- most_popular_in_year(1994)

# Write a function `number_per_year` that takes in a name and a year, and 
# returns how many babies born that year have that name.
number_per_year <- function(name_given, year) {
  names_per_year <- names_df[names_df$year == year,]
  num_babies_yr <- names_per_year[names_per_year$name == name_given, "prop"]
  return(num_babies_yr)
}

# How many babies had the name 'Laura' in 1995?
num_laura_1995 <- number_per_year("Laura", 1995)

# How many babies had your name in the year you were born?
# dataset only has female names, so if your name is not in the dataset feel 
# free to pick a random name for this question
# MY NAME WILL NOT APPEAR, ERGO I WILL USE Kylie
num_kylie_2003 <- number_per_year("Kylie", 2003)

# Write a function `root_per_year` that takes in a name root and a year, and 
# returns how many babies born that year have that name.
root_per_year <- function(name_root, year) {
  name_per_year <- names_df[names_df$year == year,]
  all_names_w_root <- sum(name_per_year
                          [str_detect(name_per_year$name, name_root), "prop"])
  return(all_names_w_root)
}

print(root_per_year("Jul", 2013))