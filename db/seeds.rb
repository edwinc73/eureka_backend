require 'faker'

oils = [
  { name: "Olive oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 2 },
  { name: "Coconut oil", calories: 862, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 2 },
  { name: "Canola oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Vegetable oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Sunflower oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Sesame oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Peanut oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Grapeseed oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Avocado oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Corn oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 },
  { name: "Walnut oil", calories: 884, portion_size: 100, fats: 100, proteins: 0, carbs: 0, fiber: 0, sodium: 0 }
]


oils.each do |oil|
  Ingredient.create!(
    name: oil[:name],
    calories: oil[:calories],
    portion_size: oil[:portion_size],
    fats: oil[:fats],
    proteins: oil[:proteins],
    carbs: oil[:carbs],
    fiber: oil[:fiber],
    sodium: oil[:sodium],
    category: "Oils"
  )
end

meats = [
  { name: "Chicken breast", calories: 165, portion_size: 100, fats: 3.6, proteins: 31, carbs: 0, fiber: 0, sodium: 40 },
  { name: "Beef steak", calories: 250, portion_size: 100, fats: 17, proteins: 26, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Pork chops", calories: 206, portion_size: 100, fats: 9.7, proteins: 25.7, carbs: 0, fiber: 0, sodium: 58 },
  { name: "Salmon", calories: 206, portion_size: 100, fats: 13.5, proteins: 22, carbs: 0, fiber: 0, sodium: 47 },
  { name: "Tuna", calories: 184, portion_size: 100, fats: 6, proteins: 29, carbs: 0, fiber: 0, sodium: 399 },
  { name: "Shrimp", calories: 85, portion_size: 100, fats: 0.6, proteins: 20, carbs: 0, fiber: 0, sodium: 111 },
  { name: "Lamb", calories: 282, portion_size: 100, fats: 23, proteins: 17, carbs: 0, fiber: 0, sodium: 51 },
  { name: "Turkey", calories: 208, portion_size: 100, fats: 10, proteins: 28, carbs: 0, fiber: 0, sodium: 60 },
  { name: "Duck", calories: 337, portion_size: 100, fats: 30, proteins: 16, carbs: 0, fiber: 0, sodium: 50 },
  { name: "Ground beef", calories: 250, portion_size: 100, fats: 20, proteins: 26, carbs: 0, fiber: 0, sodium: 75 },
  { name: "Chicken thighs", calories: 209, portion_size: 100, fats: 15.7, proteins: 20.8, carbs: 0, fiber: 0, sodium: 68 },
  { name: "Ground turkey", calories: 149, portion_size: 100, fats: 7.5, proteins: 19, carbs: 0, fiber: 0, sodium: 73 },
  { name: "Pork tenderloin", calories: 143, portion_size: 100, fats: 3.5, proteins: 24, carbs: 0, fiber: 0, sodium: 53 },
  { name: "Bacon", calories: 42, portion_size: 100, fats: 3.3, proteins: 2, carbs: 0, fiber: 0, sodium: 141 },
  { name: "Ham", calories: 145, portion_size: 100, fats: 5, proteins: 18, carbs: 1, fiber: 0, sodium: 930 },
  { name: "Venison", calories: 158, portion_size: 100, fats: 4, proteins: 26, carbs: 0, fiber: 0, sodium: 60 },
  { name: "Beef", calories: 250, portion_size: 100, fats: 20, proteins: 26, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Pork", calories: 242, portion_size: 100, fats: 16, proteins: 21, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Chicken", calories: 165, portion_size: 100, fats: 3.6, proteins: 31, carbs: 0, fiber: 0, sodium: 40 },
  { name: "Lamb", calories: 282, portion_size: 100, fats: 23, proteins: 17, carbs: 0, fiber: 0, sodium: 51 },
  { name: "Turkey", calories: 208, portion_size: 100, fats: 10, proteins: 28, carbs: 0, fiber: 0, sodium: 60 },
  { name: "Duck", calories: 337, portion_size: 100, fats: 30, proteins: 16, carbs: 0, fiber: 0, sodium: 50 },
  { name: "Venison", calories: 158, portion_size: 100, fats: 4, proteins: 26, carbs: 0, fiber: 0, sodium: 60 },
  { name: "Rabbit", calories: 173, portion_size: 100, fats: 6, proteins: 22, carbs: 0, fiber: 0, sodium: 50 },
  { name: "Quail", calories: 158, portion_size: 100, fats: 6, proteins: 24, carbs: 0, fiber: 0, sodium: 85 },
  { name: "Goat", calories: 109, portion_size: 100, fats: 2.3, proteins: 23, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Bison", calories: 143, portion_size: 100, fats: 2.4, proteins: 28, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Kangaroo", calories: 98, portion_size: 100, fats: 1.6, proteins: 22, carbs: 0, fiber: 0, sodium: 49 },
  { name: "Elk", calories: 176, portion_size: 100, fats: 4, proteins: 34, carbs: 0, fiber: 0, sodium: 49 },
  { name: "Buffalo", calories: 109, portion_size: 100, fats: 1.8, proteins: 21, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Wild boar", calories: 155, portion_size: 100, fats: 5, proteins: 28, carbs: 0, fiber: 0, sodium: 54 },
  { name: "Ostrich", calories: 116, portion_size: 100, fats: 3, proteins: 22, carbs: 0, fiber: 0, sodium: 49 }
]

meats.each do |meat|
  Ingredient.create!(
    name: meat[:name],
    calories: meat[:calories],
    portion_size: meat[:portion_size],
    fats: meat[:fats],
    proteins: meat[:proteins],
    carbs: meat[:carbs],
    fiber: meat[:fiber],
    sodium: meat[:sodium],
    category: "Meats"
  )
end

vegetables = [
  { name: "Broccoli", calories: 55, portion_size: 100, fats: 0.6, proteins: 3.7, carbs: 11.2, fiber: 2.6, sodium: 33 },
  { name: "Lettuce", calories: 5, portion_size: 100, fats: 0.1, proteins: 0.5, carbs: 1, fiber: 1, sodium: 5 },
  { name: "Carrot", calories: 41, portion_size: 100, fats: 0.2, proteins: 0.9, carbs: 9.6, fiber: 2.8, sodium: 69 },
  { name: "Tomato", calories: 18, portion_size: 100, fats: 0.2, proteins: 0.9, carbs: 3.9, fiber: 1.2, sodium: 5 },
  { name: "Spinach", calories: 23, portion_size: 100, fats: 0.4, proteins: 2.9, carbs: 3.6, fiber: 2.2, sodium: 79 },
  { name: "Bell pepper", calories: 31, portion_size: 100, fats: 0.3, proteins: 1.3, carbs: 6, fiber: 2.1, sodium: 4 },
  { name: "Cucumber", calories: 15, portion_size: 100, fats: 0.1, proteins: 0.7, carbs: 3.6, fiber: 0.5, sodium: 2 },
  { name: "Onion", calories: 40, portion_size: 100, fats: 0.1, proteins: 1.1, carbs: 9.3, fiber: 1.7, sodium: 4 },
  { name: "Lettuce", calories: 5, portion_size: 100, fats: 0.1, proteins: 0.5, carbs: 1, fiber: 1, sodium: 5 },
  { name: "Cabbage", calories: 25, portion_size: 100, fats: 0.1, proteins: 1.3, carbs: 6, fiber: 2.5, sodium: 18 },
  { name: "Zucchini", calories: 17, portion_size: 100, fats: 0.3, proteins: 1.2, carbs: 3.1, fiber: 1, sodium: 8 },
  { name: "Eggplant", calories: 25, portion_size: 100, fats: 0.2, proteins: 0.9, carbs: 6, fiber: 3, sodium: 2 },
  { name: "Green beans", calories: 31, portion_size: 100, fats: 0.1, proteins: 1.8, carbs: 7.1, fiber: 3.4, sodium: 2 },
  { name: "Cauliflower", calories: 25, portion_size: 100, fats: 0.3, proteins: 2, carbs: 5, fiber: 2, sodium: 30 },
  { name: "Peas", calories: 81, portion_size: 100, fats: 0.4, proteins: 5, carbs: 14, fiber: 5, sodium: 5 },
  { name: "Sweet potato", calories: 86, portion_size: 100, fats: 0.1, proteins: 1.6, carbs: 20, fiber: 3, sodium: 55 },
  { name: "Mushroom", calories: 22, portion_size: 100, fats: 0.3, proteins: 3.1, carbs: 3.3, fiber: 1, sodium: 5 },
  { name: "Asparagus", calories: 20, portion_size: 100, fats: 0.2, proteins: 2.2, carbs: 3.7, fiber: 2.1, sodium: 2 }
]

vegetables.each do |vegetable|
  Ingredient.create!(
    name: vegetable[:name],
    calories: vegetable[:calories],
    portion_size: vegetable[:portion_size],
    fats: vegetable[:fats],
    proteins: vegetable[:proteins],
    carbs: vegetable[:carbs],
    fiber: vegetable[:fiber],
    sodium: vegetable[:sodium],
    category: "vegetables"
  )
end

dairy_products = [
  { name: "Milk", calories: 60, portion_size: 100, fats: 3.4, proteins: 3.3, carbs: 4.8, fiber: 0, sodium: 44 },
  { name: "Cheese", calories: 402, portion_size: 100, fats: 33.1, proteins: 24.9, carbs: 1.3, fiber: 0, sodium: 621 },
  { name: "Yogurt", calories: 59, portion_size: 100, fats: 0.4, proteins: 10, carbs: 3.6, fiber: 0, sodium: 36 },
  { name: "Butter", calories: 717, portion_size: 100, fats: 81, proteins: 0.9, carbs: 0.1, fiber: 0, sodium: 684 },
  { name: "Sour cream", calories: 193, portion_size: 100, fats: 19, proteins: 2.6, carbs: 3.7, fiber: 0, sodium: 56 },
  { name: "Cottage cheese", calories: 98, portion_size: 100, fats: 4.3, proteins: 11, carbs: 3.4, fiber: 0, sodium: 364 },
  { name: "Cream cheese", calories: 342, portion_size: 100, fats: 34.9, proteins: 6.8, carbs: 3.7, fiber: 0, sodium: 387 },
  { name: "Whipped cream", calories: 257, portion_size: 100, fats: 28, proteins: 2.8, carbs: 2.7, fiber: 0, sodium: 29 },
  { name: "Condensed milk", calories: 321, portion_size: 100, fats: 8.9, proteins: 8.2, carbs: 54, fiber: 0, sodium: 114 },
  { name: "Evaporated milk", calories: 134, portion_size: 100, fats: 7.9, proteins: 7.9, carbs: 9.7, fiber: 0, sodium: 108 },
  { name: "Ice cream", calories: 207, portion_size: 100, fats: 11, proteins: 2.8, carbs: 24, fiber: 0.5, sodium: 73 },
  { name: "Margarine", calories: 717, portion_size: 100, fats: 81.1, proteins: 0.9, carbs: 0.1, fiber: 0, sodium: 658 },
  { name: "Mozzarella cheese", calories: 300, portion_size: 100, fats: 22.3, proteins: 22.2, carbs: 2.2, fiber: 0, sodium: 627 },
  { name: "Cheddar cheese", calories: 403, portion_size: 100, fats: 33.1, proteins: 24.9, carbs: 1.3, fiber: 0, sodium: 621 },
  { name: "Parmesan cheese", calories: 431, portion_size: 100, fats: 29.2, proteins: 38.4, carbs: 3.4, fiber: 0, sodium: 1388 },
  { name: "Cream", calories: 340, portion_size: 100, fats: 35, proteins: 2.6, carbs: 3.4, fiber: 0, sodium: 41 }
]

dairy_products.each do |dairy|
  Ingredient.create!(
    name: dairy[:name],
    calories: dairy[:calories],
    portion_size: dairy[:portion_size],
    fats: dairy[:fats],
    proteins: dairy[:proteins],
    carbs: dairy[:carbs],
    fiber: dairy[:fiber],
    sodium: dairy[:sodium],
    category: "Dairy products"
  )
end

grains = [
  { name: "Rice", calories: 130, portion_size: 100, fats: 0.3, proteins: 2.7, carbs: 28.2, fiber: 0.4, sodium: 1 },
  { name: "Wheat", calories: 329, portion_size: 100, fats: 1.9, proteins: 13.7, carbs: 71.2, fiber: 12.2, sodium: 2 },
  { name: "Barley", calories: 354, portion_size: 100, fats: 2.3, proteins: 12.5, carbs: 73.5, fiber: 17.3, sodium: 6 },
  { name: "Oats", calories: 389, portion_size: 100, fats: 6.9, proteins: 16.9, carbs: 66.3, fiber: 10.6, sodium: 2 },
  { name: "Corn", calories: 365, portion_size: 100, fats: 4.7, proteins: 9.4, carbs: 74.3, fiber: 7.3, sodium: 1 },
  { name: "Quinoa", calories: 120, portion_size: 100, fats: 1.9, proteins: 4.4, carbs: 21.3, fiber: 2.8, sodium: 2 },
  { name: "Buckwheat", calories: 343, portion_size: 100, fats: 3.4, proteins: 13.3, carbs: 71.5, fiber: 10, sodium: 1 },
  { name: "Millet", calories: 378, portion_size: 100, fats: 4.2, proteins: 11, carbs: 73.9, fiber: 8.5, sodium: 5 },
  { name: "Rye", calories: 335, portion_size: 100, fats: 1.5, proteins: 11.5, carbs: 72.6, fiber: 15.1, sodium: 2 },
  { name: "Sorghum", calories: 339, portion_size: 100, fats: 3.3, proteins: 10.6, carbs: 72.1, fiber: 6.3, sodium: 1 },
  { name: "Amaranth", calories: 371, portion_size: 100, fats: 7.1, proteins: 14.4, carbs: 65.3, fiber: 6.7, sodium: 4 },
  { name: "Spelt", calories: 338, portion_size: 100, fats: 2.4, proteins: 14.6, carbs: 70.2, fiber: 10.7, sodium: 2 },
  { name: "Bulgur", calories: 83, portion_size: 100, fats: 0.2, proteins: 3.1, carbs: 18.6, fiber: 3.1, sodium: 2 },
  { name: "Farro", calories: 337, portion_size: 100, fats: 1.8, proteins: 11, carbs: 73.5, fiber: 7.7, sodium: 4 },
  { name: "Triticale", calories: 339, portion_size: 100, fats: 1.2, proteins: 13.1, carbs: 73.6, fiber: 8.6, sodium: 1 },
  { name: "Kamut", calories: 337, portion_size: 100, fats: 2, proteins: 14.3, carbs: 71.5, fiber: 10.7, sodium: 2 },
  { name: "Sorghum flour", calories: 338, portion_size: 100, fats: 3.3, proteins: 10.6, carbs: 72.1, fiber: 6.3, sodium: 1 }
]

grains.each do |grain|
  Ingredient.create!(
    name: grain[:name],
    calories: grain[:calories],
    portion_size: grain[:portion_size],
    fats: grain[:fats],
    proteins: grain[:proteins],
    carbs: grain[:carbs],
    fiber: grain[:fiber],
    sodium: grain[:sodium],
    category: "Grains"
  )
end

condiments = [
  { name: "Ketchup", calories: 19, portion_size: 100, fats: 0.1, proteins: 0.4, carbs: 4.1, fiber: 0.1, sodium: 1268 },
  { name: "Mustard", calories: 66, portion_size: 100, fats: 4, proteins: 6, carbs: 1, fiber: 0, sodium: 504 },
  { name: "Mayonnaise", calories: 680, portion_size: 100, fats: 75, proteins: 1.2, carbs: 0.9, fiber: 0, sodium: 636 },
  { name: "Barbecue sauce", calories: 153, portion_size: 100, fats: 0.7, proteins: 0.9, carbs: 36, fiber: 0.7, sodium: 1030 },
  { name: "Soy sauce", calories: 53, portion_size: 100, fats: 0.1, proteins: 5.6, carbs: 8.2, fiber: 0.4, sodium: 5634 },
  { name: "Hot sauce", calories: 15, portion_size: 100, fats: 0.3, proteins: 0.9, carbs: 3.2, fiber: 0.9, sodium: 2110 },
  { name: "Honey mustard", calories: 316, portion_size: 100, fats: 24, proteins: 3, carbs: 24, fiber: 1.7, sodium: 986 },
  { name: "Salsa", calories: 36, portion_size: 100, fats: 0.2, proteins: 0.9, carbs: 8.3, fiber: 1.7, sodium: 416 },
  { name: "Ranch dressing", calories: 374, portion_size: 100, fats: 38, proteins: 1, carbs: 2, fiber: 0, sodium: 1093 },
  { name: "Tartar sauce", calories: 330, portion_size: 100, fats: 34, proteins: 0.6, carbs: 7, fiber: 0.3, sodium: 768 },
  { name: "Horseradish", calories: 48, portion_size: 100, fats: 0.7, proteins: 1.2, carbs: 11, fiber: 3.3, sodium: 40 },
  { name: "Sriracha sauce", calories: 49, portion_size: 100, fats: 0.4, proteins: 0.9, carbs: 11, fiber: 0.8, sodium: 2110 },
  { name: "Tahini", calories: 595, portion_size: 100, fats: 53, proteins: 17, carbs: 18, fiber: 9.3, sodium: 14 },
  { name: "Peanut butter", calories: 588, portion_size: 100, fats: 50, proteins: 25, carbs: 20, fiber: 6, sodium: 441 },
  { name: "Maple syrup", calories: 260, portion_size: 100, fats: 0, proteins: 0, carbs: 67, fiber: 0, sodium: 4 },
  { name: "Vinegar", calories: 18, portion_size: 100, fats: 0, proteins: 0, carbs: 0.9, fiber: 0, sodium: 2 }
]

condiments.each do |condiment|
  Ingredient.create!(
    name: condiment[:name],
    calories: condiment[:calories],
    portion_size: condiment[:portion_size],
    fats: condiment[:fats],
    proteins: condiment[:proteins],
    carbs: condiment[:carbs],
    fiber: condiment[:fiber],
    sodium: condiment[:sodium],
    category: "Condiments"
  )
end

30.times do
  username = Faker::Internet.username(specifier: 5..18)
  age = rand(15..60)
  weight = rand(35..100)
  height = rand(150..200)
  gender = ["m", "f"].sample
  User.create!(
    username: username,
    age: age,
    weight: weight,
    height: height,
    gender: gender
  )
end
