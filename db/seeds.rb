require 'open-uri'
require 'json'


url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
document = open(url).read
html_doc = JSON.parse(document)

drinks = html_doc["drinks"]

drinks.each do |drink|
  ingredients = drink["strIngredient1"]
  Ingredient.create!(name: ingredients)
end
