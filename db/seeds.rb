require 'faker'
require 'open-uri'

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
  { name: "Ostrich", calories: 116, portion_size: 100, fats: 3, proteins: 22, carbs: 0, fiber: 0, sodium: 49 },
  { name:"Egg", calories: 142, portion_size: 100, fats: 9.9, proteins: 12.2, carbs: 1.4, fiber: 0, sodium: 136}
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
  { name: "Sorghum flour", calories: 338, portion_size: 100, fats: 3.3, proteins: 10.6, carbs: 72.1, fiber: 6.3, sodium: 1 },
  { name: "Pasta cooked", calories: 131, portion_size: 100, fats: 0.5, proteins: 7, carbs: 30 ,fiber: 3, sodium: 1}
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
  { name: "Vinegar", calories: 18, portion_size: 100, fats: 0, proteins: 0, carbs: 0.9, fiber: 0, sodium: 2 },
  { name: "Water", calories: 0, portion_size: 0, fats: 0, proteins: 0, carbs: 0, fiber: 0, sodium: 0 }
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
  avatar = ['dogs', 'sports', 'cars'].sample
  image = Faker::LoremFlickr.image(size: "100x100", search_terms: [avatar])
  age = rand(15..60)
  weight = rand(35..100)
  height = rand(150..200)
  gender = ["m", "f"].sample
  goal_weight = rand(45..75)
  User.create!(
    username: username,
    age: age,
    image: image,
    weight: weight,
    height: height,
    gender: gender,
    goal_weight: goal_weight
  )
end
recipes = [
  {
    name: "Pasta Carbonara",
    description: "Classic Italian pasta dish with creamy sauce and bacon",
    instructions: "1. Cook the pasta in a large pot of salted boiling water until al dente.\n2. In a skillet, cook the bacon until crispy. Remove from heat and set aside.\n3. In a bowl, whisk together the eggs, grated cheese, and black pepper.\n4. Drain the pasta, reserving a small amount of the cooking water.\n5. While the pasta is still hot, add it to the skillet with the cooked bacon. Toss to combine.\n6. Gradually pour the egg mixture over the hot pasta, stirring quickly to coat the pasta evenly.\n7. If the sauce is too thick, add a small amount of the reserved cooking water to thin it out.\n8. Serve immediately with extra grated cheese on top.",
    total_calories: 650,
    fat: 40,
    protein: 30,
    carbs: 60,
    fiber: 10,
    sodium: 700,
    category: "Main Dish",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2020/10/spaghetti-carbonara-01.jpg"
  },
  {
    name: "Caprese Salad",
    description: "Refreshing Italian salad with tomatoes, mozzarella, and basil",
    instructions: "1. Slice the tomatoes and mozzarella into thick rounds.\n2. Arrange the tomato and mozzarella slices on a platter, alternating them.\n3. Sprinkle fresh basil leaves over the tomato and mozzarella slices.\n4. Drizzle with olive oil and balsamic vinegar.\n5. Season with salt and pepper to taste.\n6. Let the salad sit for a few minutes to allow the flavors to meld.\n7. Serve as a side dish or as a light lunch.",
    total_calories: 250,
    fat: 15,
    protein: 15,
    carbs: 10,
    fiber: 12,
    sodium: 200,
    category: "Salad",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2020/07/caprese-salad-5.jpg"
  },
  {
    name: "Chicken Parmesan",
    description: "Breaded chicken cutlets topped with marinara sauce and cheese",
    instructions: "1. Preheat the oven to 375°F (190°C).\n2. In a shallow dish, mix together breadcrumbs, grated Parmesan cheese, and Italian seasoning.\n3. Dip chicken cutlets in beaten eggs, then coat them in the breadcrumb mixture.\n4. Heat oil in a large skillet over medium heat. Cook the breaded chicken cutlets until golden brown on both sides.\n5. Transfer the cooked chicken cutlets to a baking dish.\n6. Spoon marinara sauce over each cutlet and sprinkle with shredded mozzarella cheese.\n7. Bake in the preheated oven for about 20 minutes or until the cheese is melted and bubbly.\n8. Serve hot with cooked pasta or a side salad.",
    total_calories: 450,
    fat: 20,
    protein: 35,
    carbs: 30,
    fiber: 12,
    sodium: 500,
    category: "Main Dish",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2013/02/chicken-parmesan-14.jpg"
  },
  {
    name: "Banana Bread",
    description: "Moist and delicious homemade banana bread",
    instructions: "1. Preheat the oven to 350°F (175°C). Grease a loaf pan.\n2. In a large bowl, cream together butter and sugar until light and fluffy.\n3. Beat in eggs one at a time, then stir in mashed bananas and vanilla extract.\n4. In a separate bowl, combine flour, baking soda, and salt.\n5. Gradually add the dry ingredients to the banana mixture and mix until just combined.\n6. Pour the batter into the prepared loaf pan.\n7. Bake for 60 to 65 minutes, or until a toothpick inserted into the center comes out clean.\n8. Allow the banana bread to cool in the pan for 10 minutes, then transfer it to a wire rack to cool completely.\n9. Slice and serve.",
    total_calories: 200,
    fat: 8,
    protein: 3,
    carbs: 30,
    fiber: 14,
    sodium: 50,
    category: "Dessert",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2015/05/skinny-banana-bread6-srgb.1.jpg"
  },
  {
    name: "Grilled Salmon with Lemon Butter",
    description: "Flavorful grilled salmon fillets with a tangy lemon butter sauce",
    instructions: "1. Preheat the grill to medium-high heat.\n2. Season salmon fillets with salt, pepper, and a drizzle of olive oil.\n3. Place the salmon fillets on the preheated grill and cook for about 4-5 minutes per side, or until the fish is cooked through.\n4. In a small saucepan, melt butter over medium heat. Stir in fresh lemon juice, lemon zest, and minced garlic. Cook for 1-2 minutes.\n5. Remove the salmon from the grill and transfer to a serving plate.\n6. Drizzle the lemon butter sauce over the grilled salmon fillets.\n7. Garnish with fresh parsley and lemon slices.\n8. Serve hot with your choice of side dishes.",
    total_calories: 350,
    fat: 25,
    protein: 30,
    carbs: 2,
    fiber: 10,
    sodium: 400,
    category: "Main Dish",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2018/05/grilled-lemon-herb-salmon-7.jpg"
  },
  {
    name: "Mediterranean Quinoa Salad",
    description: "Healthy and vibrant salad with quinoa, fresh vegetables, and feta cheese",
    instructions: "1. Cook quinoa according to package instructions. Let it cool.\n2. In a large bowl, combine cooked quinoa, diced cucumbers, cherry tomatoes, chopped red onion, sliced olives, and crumbled feta cheese.\n3. In a small bowl, whisk together olive oil, lemon juice, minced garlic, dried oregano, salt, and pepper to make the dressing.\n4. Pour the dressing over the quinoa and vegetable mixture. Toss to combine.\n5. Taste and adjust the seasoning if needed.\n6. Chill the salad in the refrigerator for at least 30 minutes before serving.\n7. Garnish with fresh parsley and serve as a side dish or a light meal.",
    total_calories: 250,
    fat: 10,
    protein: 8,
    carbs: 35,
    fiber: 12,
    sodium: 100,
    category: "Salad",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2020/01/quinoa-salad-16.jpg"
  },
  {
    name: "Beef Stir-Fry",
    description: "Quick and flavorful stir-fried beef with vegetables",
    instructions: "1. In a small bowl, whisk together soy sauce, oyster sauce, sesame oil, and cornstarch. Set aside.\n2. Heat vegetable oil in a wok or large skillet over high heat.\n3. Add thinly sliced beef and stir-fry until browned and cooked to your desired doneness. Remove the beef from the pan and set aside.\n4. In the same pan, add sliced bell peppers, broccoli florets, and thinly sliced carrots. Stir-fry for a few minutes until the vegetables are crisp-tender.\n5. Return the beef to the pan and pour the sauce mixture over the beef and vegetables.\n6. Stir-fry for an additional 1-2 minutes until the sauce thickens and coats the ingredients.\n7. Remove from heat and garnish with chopped green onions.\n8. Serve hot with steamed rice or noodles.",
    total_calories: 400,
    fat: 15,
    protein: 25,
    carbs: 40,
    fiber: 16,
    sodium: 500,
    category: "Main Dish",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2016/07/szechuan_chicken_stir_fry9..jpg"
  },
  {
    name: "Roasted Vegetable Frittata",
    description: "Hearty and nutritious baked egg dish with roasted vegetables",
    instructions: "1. Preheat the oven to 375°F (190°C).\n2. Toss diced vegetables (such as bell peppers, zucchini, mushrooms, and onions) with olive oil, salt, and pepper.\n3. Spread the vegetables in a single layer on a baking sheet and roast for about 20-25 minutes, or until they are tender and slightly caramelized.\n4. In a large bowl, whisk together eggs, milk, grated cheese, salt, and pepper.\n5. Grease a baking dish and spread the roasted vegetables evenly on the bottom.\n6. Pour the egg mixture over the vegetables, ensuring they are well covered.\n7. Bake in the preheated oven for 25-30 minutes, or until the frittata is set in the center and lightly golden on top.\n8. Let it cool for a few minutes, then slice into wedges and serve.",
    total_calories: 300,
    fat: 20,
    protein: 15,
    carbs: 15,
    fiber: 10,
    sodium: 300,
    category: "Breakfast",
    photo: "https://www.cookingclassy.com/wp-content/uploads/2018/12/roasted-vegetables-10.jpg"
  },
  {
    name: "Spaghetti Bolognese",
    description: "Classic Italian pasta dish with a rich meat sauce",
    instructions: "1. Heat olive oil in a large saucepan over medium heat.\n2. Add chopped onions, garlic, and minced beef to the saucepan. Cook until the meat is browned.\n3. Stir in tomato paste, canned tomatoes, and herbs. Simmer for 30 minutes.\n4. Cook spaghetti according to package instructions.\n5. Serve the Bolognese sauce over cooked spaghetti. Sprinkle with grated Parmesan cheese.\n6. Garnish with fresh basil leaves.",
    total_calories: 400,
    fat: 20,
    protein: 25,
    carbs: 35,
    fiber: 5,
    sodium: 500,
    category: "Main Dish",
    photo: "https://www.recipetineats.com/wp-content/uploads/2018/07/Spaghetti-Bolognese.jpg"
  },
  {
    name: "Chicken Stir-Fry",
    description: "Quick and easy stir-fry with tender chicken and colorful vegetables",
    instructions: "1. Heat oil in a wok or large skillet over high heat.\n2. Add sliced chicken and cook until browned and cooked through.\n3. Remove the chicken from the wok and set aside.\n4. Add chopped vegetables (such as bell peppers, carrots, and broccoli) to the wok. Stir-fry until crisp-tender.\n5. Return the chicken to the wok and toss with the vegetables.\n6. In a small bowl, mix together soy sauce, ginger, garlic, and cornstarch. Pour over the chicken and vegetables.\n7. Cook for another 1-2 minutes until the sauce thickens.\n8. Serve the stir-fry over steamed rice.",
    total_calories: 350,
    fat: 10,
    protein: 30,
    carbs: 40,
    fiber: 8,
    sodium: 600,
    category: "Main Dish",
    photo: "https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2021/05/Chicken-Stir-Fry-9.jpg"
  },
  {
    name: "Avocado Toast",
    description: "Simple and delicious toast topped with mashed avocado",
    instructions: "1. Toast slices of bread until golden brown.\n2. In a bowl, mash ripe avocados with a fork. Season with salt, pepper, and a squeeze of lemon juice.\n3. Spread the mashed avocado onto the toasted bread.\n4. Optional: Top with additional ingredients like sliced tomatoes, feta cheese, or a drizzle of olive oil.\n5. Serve as a quick and nutritious breakfast or snack.",
    total_calories: 200,
    fat: 15,
    protein: 5,
    carbs: 10,
    fiber: 7,
    sodium: 150,
    category: "Breakfast",
    photo: "https://www.eatingwell.com/thmb/YwNw19g19tS31P21KvIBFo1mVFk=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/1807w-avocado-toast-recipe-8029771-2000-aefaa92c11e74e80b0bfc15788a61465.jpg"
  },
  {
    name: "Greek Salad",
    description: "Traditional Mediterranean salad with fresh vegetables and feta cheese",
    instructions: "1. Chop cucumber, tomatoes, red onion, and bell peppers into bite-sized pieces.\n2. In a large bowl, combine the chopped vegetables, Kalamata olives, and crumbled feta cheese.\n3. Drizzle with olive oil and red wine vinegar.\n4. Season with dried oregano, salt, and pepper.\n5. Toss to combine all the ingredients.\n6. Serve as a refreshing side dish or light lunch.",
    total_calories: 250,
    fat: 20,
    protein: 10,
    carbs: 15,
    fiber: 5,
    sodium: 400,
    category: "Salad",
    photo: "https://www.simplyrecipes.com/thmb/Mo0HabY7Va_kEJtbtVmjdCqMzsI=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2011__08__dads-greek-salad-vertical-a-1600-d67fd37678a64815996f56e7ec02d452.jpg"
  },
  {
    name: "Mango Smoothie",
    description: "Creamy and tropical smoothie made with ripe mangoes",
    instructions: "1. Peel and dice ripe mangoes.\n2. In a blender, combine diced mangoes, Greek yogurt, honey, and a splash of orange juice.\n3. Blend until smooth and creamy.\n4. Optional: Add ice cubes for a chilled smoothie.\n5. Pour the smoothie into glasses and garnish with fresh mint leaves.\n6. Enjoy as a refreshing breakfast or snack.",
    total_calories: 250,
    fat: 5,
    protein: 8,
    carbs: 50,
    fiber: 6,
    sodium: 50,
    category: "Beverage",
    photo: "https://www.acouplecooks.com/wp-content/uploads/2020/06/Mango-Smoothie-007.jpg"
  },
  {
    name: "Quinoa Salad",
    description: "Healthy and nutritious salad with cooked quinoa, vegetables, and a tangy dressing",
    instructions: "1. Cook quinoa according to package instructions and let it cool.\n2. Chop vegetables such as cucumbers, cherry tomatoes, bell peppers, and red onions.\n3. In a large bowl, combine the cooked quinoa and chopped vegetables.\n4. In a small jar, mix together olive oil, lemon juice, Dijon mustard, and salt.\n5. Drizzle the dressing over the quinoa and vegetables.\n6. Toss to combine all the ingredients.\n7. Optional: Garnish with fresh herbs like parsley or cilantro.\n8. Serve chilled as a satisfying and flavorful salad.",
    total_calories: 300,
    fat: 10,
    protein: 8,
    carbs: 45,
    fiber: 6,
    sodium: 250,
    category: "Salad",
    photo: "https://cookieandkate.com/images/2017/08/best-quinoa-salad-recipe-3.jpg"
  },
  {
    name: "Pesto Pasta",
    description: "Delicious pasta dish tossed in a flavorful basil pesto sauce",
    instructions: "1. Cook pasta according to package instructions until al dente.\n2. In a food processor, blend fresh basil leaves, pine nuts, garlic, Parmesan cheese, and olive oil until smooth.\n3. Drain the cooked pasta and return it to the pot.\n4. Add the prepared pesto sauce to the pasta and toss to coat.\n5. Optional: Add cooked chicken or roasted vegetables for extra flavor and texture.\n6. Serve the pesto pasta hot and garnish with additional Parmesan cheese and fresh basil.",
    total_calories: 400,
    fat: 18,
    protein: 12,
    carbs: 50,
    fiber: 4,
    sodium: 350,
    category: "Main Dish",
    photo: "https://www.recipetineats.com/wp-content/uploads/2019/02/Pesto-Pasta_2-1.jpg"
  },
  {
    name: "Berry Smoothie Bowl",
    description: "Colorful and refreshing smoothie bowl topped with fresh berries and granola",
    instructions: "1. In a blender, combine frozen mixed berries, banana, Greek yogurt, and a splash of almond milk.\n2. Blend until smooth and creamy.\n3. Pour the smoothie into a bowl.\n4. Top with fresh berries, sliced banana, granola, and a drizzle of honey.\n5. Optional: Add chia seeds or flaxseeds for added nutrition.\n6. Enjoy the smoothie bowl as a nourishing breakfast or snack.",
    total_calories: 300,
    fat: 6,
    protein: 8,
    carbs: 55,
    fiber: 10,
    sodium: 100,
    category: "Beverage",
    photo: "https://minimalistbaker.com/wp-content/uploads/2016/07/The-PERFECT-5-minute-Smoothie-Bowl-Simple-ingredients-naturally-sweet-SO-healthy-vegan-glutenfree-smoothiebowl-recipe.jpg"
  },
  {
    name: "Fruit Salad",
    description: "Colorful and refreshing salad with a variety of fresh fruits",
    instructions: "1. Chop fruits such as watermelon, pineapple, strawberries, grapes, and kiwi into bite-sized pieces.\n2. In a large bowl, combine the chopped fruits.\n3. Optional: Add a squeeze of lemon or lime juice to prevent the fruits from browning.\n4. Toss the fruits gently to combine.\n5. Optional: Add a drizzle of honey or a sprinkle of mint leaves for extra flavor.\n6. Chill the fruit salad in the refrigerator for at least 30 minutes before serving.\n7. Serve the fruit salad as a refreshing and healthy dessert or snack.",
    total_calories: 150,
    fat: 1,
    protein: 2,
    carbs: 38,
    fiber: 5,
    sodium: 5,
    category: "Salad",
    photo: "https://hips.hearstapps.com/hmg-prod/images/fruit-salad-vertical-jpg-1522181929.jpg?crop=0.696xw:0.464xh;0.252xw,0.286xh&resize=980:*"
  },
  {
    name: "Grilled Chicken Caesar Salad",
    description: "Classic Caesar salad with grilled chicken breast",
    instructions: "1. Season chicken breast with salt, pepper, and your choice of herbs.\n2. Grill the chicken breast until cooked through.\n3. Slice the grilled chicken into thin strips.\n4. In a large bowl, combine romaine lettuce, croutons, grated Parmesan cheese, and Caesar dressing.\n5. Toss the salad ingredients to coat them with the dressing.\n6. Top the salad with the sliced grilled chicken.\n7. Serve the grilled chicken Caesar salad as a hearty and flavorful meal.",
    total_calories: 350,
    fat: 18,
    protein: 30,
    carbs: 20,
    fiber: 4,
    sodium: 450,
    category: "Salad",
    photo: "https://static01.nyt.com/images/2015/06/17/dining/17PAIR2/17PAIR2-articleLarge.jpg?w=1280&q=75"
  },
  {
    name: "Margherita Pizza",
    description: "Classic Italian pizza topped with fresh tomatoes, mozzarella, and basil",
    instructions: "1. Preheat the oven to the highest temperature.\n2. Roll out the pizza dough into a round shape.\n3. Place the pizza dough on a baking sheet or pizza stone.\n4. Spread tomato sauce evenly over the pizza dough.\n5. Top with slices of fresh mozzarella cheese and tomato slices.\n6. Sprinkle with salt, pepper, and fresh basil leaves.\n7. Bake the pizza in the preheated oven for about 10-12 minutes or until the crust is golden and crispy.\n8. Remove from the oven and let it cool slightly before slicing.\n9. Serve the Margherita pizza hot and enjoy!",
    total_calories: 300,
    fat: 12,
    protein: 14,
    carbs: 36,
    fiber: 2,
    sodium: 550,
    category: "Main Dish",
    photo: "https://cookieandkate.com/images/2021/07/margherita-pizza-recipe-1-2-1097x1650.jpg"
  },
  {
    name: "Spinach and Feta Stuffed Chicken Breast",
    description: "Juicy chicken breast filled with spinach and feta cheese",
    instructions: "1. Preheat the oven to 400°F (200°C).\n2. Butterfly the chicken breasts by making a lengthwise cut, but not cutting all the way through.\n3. Season the inside of each chicken breast with salt and pepper.\n4. In a bowl, mix together chopped spinach, crumbled feta cheese, minced garlic, and a drizzle of olive oil.\n5. Stuff the chicken breasts with the spinach and feta mixture.\n6. Secure the openings with toothpicks.\n7. Place the stuffed chicken breasts on a baking sheet.\n8. Bake in the preheated oven for 25-30 minutes or until the chicken is cooked through.\n9. Remove the toothpicks before serving.",
    total_calories: 400,
    fat: 18,
    protein: 45,
    carbs: 5,
    fiber: 2,
    sodium: 550,
    category: "Poultry",
    photo: "https://feelgoodfoodie.net/wp-content/uploads/2017/03/Spinach-_-Feta-Stuffed-Chicken-11.jpg"
  },
  {
    name: "Kung Pao Chicken",
    description: "Spicy and flavorful stir-fried chicken dish with peanuts and vegetables",
    instructions: "1. Marinate diced chicken breast with soy sauce, rice vinegar, and cornstarch for about 20 minutes.\n2. In a wok or large skillet, heat oil over high heat.\n3. Add dried red chili peppers and stir-fry for a few seconds to release the heat.\n4. Add the marinated chicken and stir-fry until cooked through.\n5. Add chopped vegetables such as bell peppers, zucchini, and carrots. Stir-fry for a few more minutes.\n6. In a small bowl, mix together soy sauce, rice vinegar, sugar, and cornstarch to make the sauce.\n7. Pour the sauce over the chicken and vegetables. Stir-fry until the sauce thickens.\n8. Garnish with roasted peanuts and green onions.\n9. Serve the Kung Pao Chicken with steamed rice.",
    total_calories: 400,
    fat: 18,
    protein: 30,
    carbs: 25,
    fiber: 4,
    sodium: 800,
    category: "Main Dish",
    photo: "https://cafedelites.com/wp-content/uploads/2018/04/Best-Kung-Pao-Chicken-IMAGE-2.jpg"
  },
  {
    name: "Mapo Tofu",
    description: "Classic Sichuan dish with silky tofu and minced pork in a spicy sauce",
    instructions: "1. In a wok or large skillet, heat oil over medium heat.\n2. Add minced garlic and ginger, and sauté until fragrant.\n3. Add minced pork and cook until browned.\n4. Stir in doubanjiang (spicy bean paste) and fermented black beans.\n5. Add tofu cubes and gently stir to coat them with the sauce.\n6. Pour in a mixture of chicken broth and cornstarch to thicken the sauce.\n7. Add diced green onions and Sichuan peppercorns.\n8. Simmer for a few minutes until the flavors are well combined.\n9. Serve the Mapo Tofu over steamed rice.",
    total_calories: 350,
    fat: 20,
    protein: 15,
    carbs: 30,
    fiber: 4,
    sodium: 700,
    category: "Main Dish",
    photo: "https://thewoksoflife.com/wp-content/uploads/2019/06/mapo-tofu-10.jpg"
  },
  {
    name: "Steamed Dumplings (Jiaozi)",
    description: "Traditional Chinese dumplings filled with a savory mixture of meat and vegetables",
    instructions: "1. In a large bowl, combine ground pork, minced garlic, minced ginger, chopped scallions, soy sauce, sesame oil, and salt.\n2. Mix well to evenly distribute the ingredients.\n3. Place a spoonful of the filling onto a dumpling wrapper.\n4. Fold the wrapper in half and pinch the edges to seal the dumpling.\n5. Repeat with the remaining filling and wrappers.\n6. Arrange the dumplings in a steamer basket lined with parchment paper.\n7. Steam the dumplings over high heat for about 10-12 minutes, or until cooked through.\n8. Serve the Steamed Dumplings with soy sauce and vinegar dipping sauce.",
    total_calories: 250,
    fat: 10,
    protein: 12,
    carbs: 30,
    fiber: 2,
    sodium: 600,
    category: "Appetizer",
    photo: "https://rasamalaysia.com/wp-content/uploads/2009/07/steamed_dumplings2.jpg"
  },
  {
    name: "Classic Cheeseburger",
    description: "Juicy beef patty topped with cheese, lettuce, tomato, and condiments, served in a bun",
    instructions: "1. Preheat the grill or stovetop griddle.\n2. Divide ground beef into equal-sized portions and shape them into patties.\n3. Season the patties with salt and pepper.\n4. Cook the patties on the grill or griddle, flipping them once, until desired doneness.\n5. Place a slice of cheese on each patty and let it melt.\n6. Toast the burger buns on the grill or in a toaster.\n7. Assemble the burgers by placing a patty on the bottom bun.\n8. Add lettuce, tomato slices, onion slices, and any desired condiments.\n9. Top with the other half of the bun.\n10. Serve the Classic Cheeseburgers with fries or a side of your choice.",
    total_calories: 500,
    fat: 30,
    protein: 25,
    carbs: 35,
    fiber: 3,
    sodium: 800,
    category: "Main Dish",
    photo: "https://iambaker.net/wp-content/uploads/2019/05/cheeseburger-1.jpg"
  },
  {
    name: "Teriyaki Chicken",
    description: "Grilled chicken glazed with a sweet and savory teriyaki sauce",
    instructions: "1. In a small bowl, mix together soy sauce, mirin, sugar, and ginger to make the teriyaki sauce.\n2. Marinate chicken thighs in the teriyaki sauce for at least 30 minutes.\n3. Preheat the grill or stovetop griddle.\n4. Grill the chicken thighs until cooked through, basting with more teriyaki sauce.\n5. Remove the chicken from the grill and let it rest for a few minutes.\n6. Slice the chicken into strips.\n7. Serve the Teriyaki Chicken over steamed rice, garnished with green onions and sesame seeds.\n8. Optional: Add a side of steamed vegetables or a salad.",
    total_calories: 300,
    fat: 10,
    protein: 25,
    carbs: 30,
    fiber: 2,
    sodium: 600,
    category: "Main Dish",
    photo: "https://www.the-girl-who-ate-everything.com/wp-content/uploads/2022/09/teriyaki-chicken-2.jpg"
  },
  {
    name: "Bibimbap",
    description: "A nutritious and flavorful Korean rice bowl with assorted toppings",
    instructions: "1. Cook rice according to package instructions.\n2. Prepare assorted toppings such as sautéed vegetables (spinach, carrots, mushrooms), cooked beef, sliced cucumber, bean sprouts, and fried egg.\n3. Arrange the cooked rice in a bowl.\n4. Place the toppings in separate sections on top of the rice.\n5. Optional: Drizzle with gochujang (Korean red chili paste) for added spiciness.\n6. Mix all the ingredients together before eating to combine the flavors.\n7. Serve the Bibimbap hot and enjoy!",
    total_calories: 400,
    fat: 12,
    protein: 20,
    carbs: 60,
    fiber: 5,
    sodium: 800,
    category: "Main Dish",
    photo: "https://www.recipetineats.com/wp-content/uploads/2019/05/Bibimbap_3.jpg"
  }
]

recipes.each do |recipe|
  new_recipe = Recipe.create!(
    name: recipe[:name],
    description: recipe[:description],
    instructions: recipe[:instructions],
    total_calories: recipe[:total_calories],
    fat: recipe[:fat],
    protein: recipe[:protein],
    carbs: recipe[:carbs],
    fiber: recipe[:fiber],
    sodium: recipe[:sodium],
    portion: 3.0,
    category: recipe[:category],
    photo: recipe[:photo],
    seed_data: true
  )
  # file = URI.open(recipe[:photo])
  # new_recipe.photos.attach(io: file, filename: "#{recipe[:name]}.jpeg", content_type: "image/jpeg")
  # new_recipe.save
end

# add ingredients into "Pasta cooked"
pasta_carbonara = Recipe.find_by(name: "Pasta Carbonara")
pasta = Ingredient.find_by(name: "Pasta cooked")
bacon = Ingredient.find_by(name: "Bacon")
egg = Ingredient.find_by(name: "Egg")
cheese = Ingredient.find_by(name: "Cheese")
olive_oil = Ingredient.find_by(name: "Olive oil")
Prep.create!(
  portion: 1.0,
  ingredient: pasta,
  recipe: pasta_carbonara
)

Prep.create!(
  portion: 0.5,
  ingredient: bacon,
  recipe: pasta_carbonara
)

Prep.create!(
  portion: 0.6,
  ingredient: egg,
  recipe: pasta_carbonara
)

Prep.create!(
  portion: 0.3,
  ingredient: cheese,
  recipe: pasta_carbonara
)

Prep.create!(
  portion: 0.2,
  ingredient: olive_oil,
  recipe: pasta_carbonara
)

50.times do
  FavouriteRecipe.create!(user: User.all.sample, recipe: Recipe.all.sample)
end

User.all.each do |user|
  Goal.create!(
    user: user,
    calorie_goal: rand(1200..2500),
    current_calorie: rand(0..3000),
    fat_goal: rand(40..80),
    protein_goal: rand(60..180),
    carbs_goal: rand(100..250),
    current_fat: rand(40..60),
    current_protein: rand(100..180),
    current_carbs: rand(120..180)
  )
end

8.times do
  Goal.create!(
    user: User.last,
    calorie_goal: 1800,
    current_calorie: rand(0..3000),
    fat_goal: 50,
    protein_goal: 150,
    carbs_goal: 180,
    current_fat: rand(40..60),
    current_protein: rand(100..180),
    current_carbs: rand(120..180)
  )
end

Goal.create!(
  user: User.last,
  calorie_goal: 1800,
  current_calorie: 0,
  fat_goal: 50,
  protein_goal: 150,
  carbs_goal: 180,
  current_fat: 0,
  current_protein: 0,
  current_carbs: 0
)

100.times do
  Meal.create!(
    recipe: Recipe.all.sample,
    goal: Goal.all.sample,
    portion: rand(0.8..3.5).round(1),
    name: ["breakfast", "lunch", "dinner"].sample
  )
end

#empty the today's meals
User.last.goals.last.meals.destroy_all

200.times do
  content = ["This recipe is a delightful combination of flavors that will tantalize your taste buds and leave you craving for more.",
    "Prepare to be impressed by the mouthwatering flavors and textures of this dish that will surely satisfy your culinary desires.",
    "Indulge in the perfect harmony of ingredients that create a truly satisfying and memorable culinary experience.",
    "Elevate your taste buds with this dish that showcases a delicious blend of flavors, textures, and aromas.",
    "Treat yourself to a culinary masterpiece that combines the best ingredients and techniques, resulting in a dish that is both comforting and indulgent.",
    "Get ready to embark on a flavor adventure with this recipe that brings together a delightful fusion of ingredients to create a truly memorable dining experience.",
    "This dish is a culinary triumph that showcases a harmonious blend of flavors, leaving you with a lingering taste of perfection.",
    "Prepare to be amazed by the exquisite combination of ingredients that dance on your palate, delivering a symphony of flavors in every bite.",
    "This recipe is a testament to culinary creativity, featuring a tantalizing medley of ingredients that will leave you craving its unique and delicious taste.",
    "Discover a culinary gem with this dish that effortlessly combines simplicity and elegance, resulting in a taste sensation that will leave you in awe.",
    "Absolutely loved this recipe! The flavors were incredible and the dish was so easy to make. Highly recommended!",
    "This recipe exceeded my expectations. The combination of ingredients was perfect, and it turned out to be a crowd-pleaser at my dinner party.",
    "I've made this recipe multiple times now, and it never disappoints. The instructions are clear, and the end result is always delicious.",
    "The flavors in this dish were a bit too strong for my liking, but it might just be a matter of personal preference. Others who enjoy bold flavors might enjoy it more.",
    "I found this recipe to be too time-consuming. It required a lot of prep work, and the end result didn't justify the effort for me.",
    "Delicious and easy to make! A new favorite in my household.",
    "The flavors in this recipe were a bit bland. I had to add extra seasoning to make it more enjoyable.",
    "This dish was a hit at my dinner party. Everyone loved it and asked for the recipe.",
    "I was pleasantly surprised by how well the ingredients complemented each other. Definitely worth trying!",
    "I followed the instructions exactly, but the dish didn't turn out as expected. It lacked flavor and was a bit dry.",
    "I'm not a fan of this recipe. The combination of ingredients didn't work for me.",
    "Amazing recipe! The presentation was beautiful, and the taste was even better.",
    "I made this for my family, and they absolutely loved it. Will be making it again soon!",
    "The recipe was easy to follow, and the results were fantastic. Highly recommended!",
    "I'm not a skilled cook, but this recipe was beginner-friendly. Turned out great!",
    "Unfortunately, this recipe didn't work out for me. The flavors didn't come together as expected.",
    "Outstanding recipe! It's become a go-to option for quick and delicious meals.",
    "I made some adjustments to the recipe based on personal preference, and it turned out fantastic.",
    "This dish was a bit too spicy for my liking, but others who enjoy heat might appreciate it.",
    "I tried this recipe with a few substitutions, and it was still delicious. Versatile and adaptable.",
    "The recipe required a long cooking time, but the end result was worth the wait. So flavorful!",
    "I'm not a fan of the texture of this dish. It was too mushy for my taste.",
    "Simple yet tasty! This recipe is perfect for busy weeknights.",
    "I would make this recipe again with some modifications. It has potential to be a standout dish.",
    "The flavors in this dish were unique and delightful. A nice change from the usual recipes.",
    "I loved how customizable this recipe was. I added my favorite ingredients and it turned out amazing."
  ].sample
  Review.create!(
    user: User.all.sample,
    recipe: Recipe.all.sample,
    rating: rand(2.5..5.0).round(1),
    content: content
  )
end

Badge.create!(name: "Starving", description: "Didn't gain any calories for the whole day", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Starving_c76vsc.png")
Badge.create!(name: "Carbo King", description: "Eat 150g of carbs in one meal", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751691/Carbo_King_sf8dq3.png")
Badge.create!(name: "Weight Watcher", description: "Awarded to users who successfully achieve their weight loss or maintenance goals.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Weight_Watcher-1_apv0rv.png")
Badge.create!(name: "Healthy Eater", description: "Awarded to users who consistently make healthy food choices.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751691/Health_Eater_ne1oqs.png")
Badge.create!(name: "Meal Designer", description: "Awarded to users who add 20 meals in one week.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751691/Meal_Designer_ghivhl.png")
Badge.create!(name: "Nutrition Expert", description: "Awarded to users who create a healthy recipe.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Weight_Watcher_o5lcbt.png")
Badge.create!(name: "Goal Achiever", description: "Awarded to users who successfully achieve 10 times daily goal", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751691/Goal_Achiever_bb4wyc.png")
Badge.create!(name: "Badge Master", description: "Awarded to users who successfully give 5 badge", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Badge_Master_ei9b7b.png")
Badge.create!(name: "Sugar-Free Champion", description: "Awarded to users who successfully reduce their intake of sugary foods and beverages.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Sugar_Free_Champion_dfr3tc.png")
Badge.create!(name: "Plate Balancer", description: "Awarded to users who create well-balanced meals with a variety of nutrients.", badge_img:"https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751690/Plate_Balancer_qvpcr9.png")
Badge.create!(name: "Eureka Chef", description: " Awarded to users who create five new recipes.", badge_img: "https://res.cloudinary.com/dj2vij3ty/image/upload/v1689751691/Eureka_Chef_ex1a0r.png")

Badge.first(4).each do |badge|
  Achievement.create!(user: User.last, badge: badge)
end
