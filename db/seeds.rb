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
recipes = [
  {
    name: "Pasta Carbonara",
    description: "Classic Italian pasta dish with creamy sauce and bacon",
    instructions: "1. Cook the pasta in a large pot of salted boiling water until al dente.\n2. In a skillet, cook the bacon until crispy. Remove from heat and set aside.\n3. In a bowl, whisk together the eggs, grated cheese, and black pepper.\n4. Drain the pasta, reserving a small amount of the cooking water.\n5. While the pasta is still hot, add it to the skillet with the cooked bacon. Toss to combine.\n6. Gradually pour the egg mixture over the hot pasta, stirring quickly to coat the pasta evenly.\n7. If the sauce is too thick, add a small amount of the reserved cooking water to thin it out.\n8. Serve immediately with extra grated cheese on top.",
    total_calories: 700,
    fat: 40,
    protein: 30,
    carbs: 60 ,
    category: "Main Dish"
  },
  {
    name: "Caprese Salad",
    description: "Refreshing Italian salad with tomatoes, mozzarella, and basil",
    instructions: "1. Slice the tomatoes and mozzarella into thick rounds.\n2. Arrange the tomato and mozzarella slices on a platter, alternating them.\n3. Sprinkle fresh basil leaves over the tomato and mozzarella slices.\n4. Drizzle with olive oil and balsamic vinegar.\n5. Season with salt and pepper to taste.\n6. Let the salad sit for a few minutes to allow the flavors to meld.\n7. Serve as a side dish or as a light lunch.",
    total_calories: 250,
    fat: 15,
    protein: 15,
    carbs: 10,
    category: "Salad"
  },
  {
    name: "Chicken Parmesan",
    description: "Breaded chicken cutlets topped with marinara sauce and cheese",
    instructions: "1. Preheat the oven to 375°F (190°C).\n2. In a shallow dish, mix together breadcrumbs, grated Parmesan cheese, and Italian seasoning.\n3. Dip chicken cutlets in beaten eggs, then coat them in the breadcrumb mixture.\n4. Heat oil in a large skillet over medium heat. Cook the breaded chicken cutlets until golden brown on both sides.\n5. Transfer the cooked chicken cutlets to a baking dish.\n6. Spoon marinara sauce over each cutlet and sprinkle with shredded mozzarella cheese.\n7. Bake in the preheated oven for about 20 minutes or until the cheese is melted and bubbly.\n8. Serve hot with cooked pasta or a side salad.",
    total_calories: 450,
    fat: 20,
    protein: 35,
    carbs: 30,
    category: "Main Dish"
  },
  {
    name: "Banana Bread",
    description: "Moist and delicious homemade banana bread",
    instructions: "1. Preheat the oven to 350°F (175°C). Grease a loaf pan.\n2. In a large bowl, cream together butter and sugar until light and fluffy.\n3. Beat in eggs one at a time, then stir in mashed bananas and vanilla extract.\n4. In a separate bowl, combine flour, baking soda, and salt.\n5. Gradually add the dry ingredients to the banana mixture and mix until just combined.\n6. Pour the batter into the prepared loaf pan.\n7. Bake for 60 to 65 minutes, or until a toothpick inserted into the center comes out clean.\n8. Allow the banana bread to cool in the pan for 10 minutes, then transfer it to a wire rack to cool completely.\n9. Slice and serve.",
    total_calories: 200,
    fat: 8,
    protein: 3,
    carbs: 30,
    category: "Dessert"
  },
  {
    name: "Grilled Salmon with Lemon Butter",
    description: "Flavorful grilled salmon fillets with a tangy lemon butter sauce",
    instructions: "1. Preheat the grill to medium-high heat.\n2. Season salmon fillets with salt, pepper, and a drizzle of olive oil.\n3. Place the salmon fillets on the preheated grill and cook for about 4-5 minutes per side, or until the fish is cooked through.\n4. In a small saucepan, melt butter over medium heat. Stir in fresh lemon juice, lemon zest, and minced garlic. Cook for 1-2 minutes.\n5. Remove the salmon from the grill and transfer to a serving plate.\n6. Drizzle the lemon butter sauce over the grilled salmon fillets.\n7. Garnish with fresh parsley and lemon slices.\n8. Serve hot with your choice of side dishes.",
    total_calories: 350,
    fat: 25,
    protein: 30,
    carbs: 2,
    category: "Main Dish"
  },
  {
    name: "Mediterranean Quinoa Salad",
    description: "Healthy and vibrant salad with quinoa, fresh vegetables, and feta cheese",
    instructions: "1. Cook quinoa according to package instructions. Let it cool.\n2. In a large bowl, combine cooked quinoa, diced cucumbers, cherry tomatoes, chopped red onion, sliced olives, and crumbled feta cheese.\n3. In a small bowl, whisk together olive oil, lemon juice, minced garlic, dried oregano, salt, and pepper to make the dressing.\n4. Pour the dressing over the quinoa and vegetable mixture. Toss to combine.\n5. Taste and adjust the seasoning if needed.\n6. Chill the salad in the refrigerator for at least 30 minutes before serving.\n7. Garnish with fresh parsley and serve as a side dish or a light meal.",
    total_calories: 250,
    fat: 10,
    protein: 8,
    carbs: 35,
    category: "Salad"
  },
  {
    name: "Beef Stir-Fry",
    description: "Quick and flavorful stir-fried beef with vegetables",
    instructions: "1. In a small bowl, whisk together soy sauce, oyster sauce, sesame oil, and cornstarch. Set aside.\n2. Heat vegetable oil in a wok or large skillet over high heat.\n3. Add thinly sliced beef and stir-fry until browned and cooked to your desired doneness. Remove the beef from the pan and set aside.\n4. In the same pan, add sliced bell peppers, broccoli florets, and thinly sliced carrots. Stir-fry for a few minutes until the vegetables are crisp-tender.\n5. Return the beef to the pan and pour the sauce mixture over the beef and vegetables.\n6. Stir-fry for an additional 1-2 minutes until the sauce thickens and coats the ingredients.\n7. Remove from heat and garnish with chopped green onions.\n8. Serve hot with steamed rice or noodles.",
    total_calories: 400,
    fat: 15,
    protein: 25,
    carbs: 40,
    category: "Main Dish"
  },
  {
    name: "Roasted Vegetable Frittata",
    description: "Hearty and nutritious baked egg dish with roasted vegetables",
    instructions: "1. Preheat the oven to 375°F (190°C).\n2. Toss diced vegetables (such as bell peppers, zucchini, mushrooms, and onions) with olive oil, salt, and pepper.\n3. Spread the vegetables in a single layer on a baking sheet and roast for about 20-25 minutes, or until they are tender and slightly caramelized.\n4. In a large bowl, whisk together eggs, milk, grated cheese, salt, and pepper.\n5. Grease a baking dish and spread the roasted vegetables evenly on the bottom.\n6. Pour the egg mixture over the vegetables, ensuring they are well covered.\n7. Bake in the preheated oven for 25-30 minutes, or until the frittata is set in the center and lightly golden on top.\n8. Let it cool for a few minutes, then slice into wedges and serve.",
    total_calories: 300,
    fat: 20,
    protein: 15,
    carbs: 15,
    category: "Breakfast"
  },
  {
  name: "Roasted Vegetable Frittata",
  description: "Hearty and nutritious baked egg dish with roasted vegetables",
  instructions: "1. Preheat the oven to 375°F (190°C).\n2. Toss diced vegetables (such as bell peppers, zucchini, mushrooms, and onions) with olive oil, salt, and pepper.\n3. Spread the vegetables in a single layer on a baking sheet and roast for about 20-25 minutes, or until they are tender and slightly caramelized.\n4. In a large bowl, whisk together eggs, milk, grated cheese, salt, and pepper.\n5. Grease a baking dish and spread the roasted vegetables evenly on the bottom.\n6. Pour the egg mixture over the vegetables, ensuring they are well covered.\n7. Bake in the preheated oven for 25-30 minutes, or until the frittata is set in the center and lightly golden on top.\n8. Let it cool for a few minutes, then slice into wedges and serve.",
  total_calories: 300,
  category: "Breakfast"
  }
]

recipes.each do |recipe|
  Recipe.create!(
    name: recipe[:name],
    description: recipe[:description],
    instructions: recipe[:instructions],
    total_calories: recipe[:total_calories],
    fat: recipe[:fat],
    protein: recipe[:protein],
    carbs: recipe[:carbs],
    category: recipe[:category]
  )
end

20.times do
  FavouriteRecipe.create!(user: User.all.sample, recipe: Recipe.all.sample)
end

User.all.each do |user|
  Goal.create!(
    user: user,
    calorie_goal: rand(1000..2000),
    current_calorie: rand(0..3000),
    fat_goal: rand(0..200),
    protein_goal: rand(0..200),
    carbs_goal: rand(0..200),
  )
end

50.times do
  Meal.create!(
    recipe: Recipe.all.sample,
    goal: Goal.all.sample,
    name: ["breakfast", "lunch", "dinner"].sample
  )
end

150.times do
  content = ["This recipe is a delightful combination of flavors that will tantalize your taste buds and leave you craving for more.",
    "Prepare to be impressed by the mouthwatering flavors and textures of this dish that will surely satisfy your culinary desires.",
    "Indulge in the perfect harmony of ingredients that create a truly satisfying and memorable culinary experience.",
    "Elevate your taste buds with this dish that showcases a delicious blend of flavors, textures, and aromas.",
    "Treat yourself to a culinary masterpiece that combines the best ingredients and techniques, resulting in a dish that is both comforting and indulgent.",
    "Get ready to embark on a flavor adventure with this recipe that brings together a delightful fusion of ingredients to create a truly memorable dining experience.",
    "This dish is a culinary triumph that showcases a harmonious blend of flavors, leaving you with a lingering taste of perfection.",
    "Prepare to be amazed by the exquisite combination of ingredients that dance on your palate, delivering a symphony of flavors in every bite.",
    "This recipe is a testament to culinary creativity, featuring a tantalizing medley of ingredients that will leave you craving its unique and delicious taste.",
    "Discover a culinary gem with this dish that effortlessly combines simplicity and elegance, resulting in a taste sensation that will leave you in awe."
  ].sample
  Review.create!(
    user: User.all.sample,
    recipe: Recipe.all.sample,
    rating: rand(2.5..5.0).round(1),
    content: content
  )
end
