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

puts 'Done!'
