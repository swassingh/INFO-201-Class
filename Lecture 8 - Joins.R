library(stringr)
library(dplyr)

food_cost_df <- read.csv("Food_Costs.csv")
census_df <- read.csv("est16us.csv")

# fix the extra rows
# Filtering where rows where Cumulative.Cost is NA
food_clean_df <- filter(food_cost_df, !is.na(Cumulative.Cost))

# only columns we want
food_clean_df <- select(food_clean_df, State.Agency.or.Indian.Tribal.Organization,
                        Cumulative.Cost)

# Aggregate tribal labs into states to get a better state level understanding
state_names <- str_trim(str_extract(food_clean_df$State.Agency.or.Indian.Tribal.Organization,
                                    "[^,]*$"))

# get states where values are abbreviations
state_names[str_length(state_names) == 2] <- 
  state.name[match(state_names[str_length(state_names) == 2], state.abb)]

# add to dataset
food_clean_df$stateName <- state_names

# aggregate the data
food_grp <- group_by(food_clean_df, stateName)
food_clean_2_df <- summarize(food_grp, yr_cost = sum(Cumulative.Cost))

# merge 2 datasets V 1 (non dplyr)
combo_df <- merge(census_df, food_clean_2_df, by.x = "Name",
                  by.y = "stateName", all.x = TRUE)

# poverty rate per state
sorted_df <- arrange(combo_df, Poverty.Percent..All.Ages)
print(sorted_df$Name)