# Percent sample
base <- 58 + 92
rate <- 58/base

percent <- round(rate  * 100, 1)

# FBI crime rates for 2012
# Pittsburgh: 13000 crimes, 317000 people
pitt_crime_perc <- 13000 / 317000 * 100
pitt_crime_per_cap <- round(13000 / 317000 * 1000)

# Tuscon 8700 crimes, 531000 people
tuscon_crime_perc <- 8700 / 531000 * 100
tuscon_crime_per_cap <- round(8700 / 531000 * 1000)

# Relative Risk

# 40 of 120 home loans were denied for Black Applicants from upper income brackets
# 300 out of 2400 home loans were denied for White Applicants from same bracket as above

# GET Denial Rates
blk_app <- 40/120
wht_app <- 300/2400

# GET Relative Risk
RR <- blk_app/wht_app # black applicants are RR times more likely to xyz than white applicants

# Percent Difference
PD <- (blk_app - wht_app) / wht_app # black applicants are PD % more likely than white applicants
