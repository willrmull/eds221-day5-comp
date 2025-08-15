library(source)

name_cart <- function(food, animal) {
  print(paste("Mc", stringr::str_to_title(animal), "'s ", stringr::str_to_title(food), "Mart", sep = ""))
}
name_cart(food = "burrito", animal = "pika")
name_cart(food = "strawberry", animal = "marmot")

source("food_cart_functions.R")

