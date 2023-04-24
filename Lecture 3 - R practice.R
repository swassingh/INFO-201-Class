print_greet_many <- function(name_a, name_b){
  print(sprintf("Hello %s and %s!", name_a, name_b))
}

print(str_detect("here is a string", "string"))

# write a function to decide if I can buy a coffee w/ how 
# much money is in wallet and price of coffee
buy_coffee <- function(coffee_price, money_in_wallet) {
  if(money_in_wallet < coffee_price){
    print("I can't buy coffee")
  } else {
    print("I can buy coffee")
  }
}