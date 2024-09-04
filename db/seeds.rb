puts 'creating user'

gabriel = User.new(
      email: "gbc@gmail.com",
      password: 123456,
      age: 33,
      weight: 120,
      height: 1.85,
      birth: nil,
      gender: "M",
      name: "gabriel",
      kilos_to_lose: 5,
      timeline: 2,
      metric: "months"
    )
gabriel.save

egg = Item.create(
  name: "egg",
  calories:78,
  fat: 5,
  carbs: 0.6,
  protein: 5
)

meal = Meal.create(
  meal_type: "breakfast"
)

MealItem.create(
  meal_id: meal,
  item_id: egg
  )

meal.user = gabriel

puts 'Done!'
