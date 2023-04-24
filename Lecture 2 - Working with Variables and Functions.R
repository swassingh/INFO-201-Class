# Practice for Class - Lecture 2 - Working with Variables and Functions

# 1. a variable ”hometown” that stores the city in which you were born
hometown <- "New Delhi"
# 2. a variable “name” that stores your name
name <- "Swastik Singh"
# 3. a variable “age” that stores your age
age <- 20L
# 4. a variable “height” that stores your height
height <- 70L
# 5. a function called mad_libs that takes in certain strings and prints out a
# completed quote. 
mad_libs <- function(name, age, height, hometown)  {
  quote <- sprintf(paste("I am %s. I am %s years-old. I've grown to be %s",
                         "inches. Lastly, I was born in %s"),
                   name, age, height, hometown)
  return(quote)
}

print_greet <- function(your_name){
  print(paste("Hello!", your_name))
}