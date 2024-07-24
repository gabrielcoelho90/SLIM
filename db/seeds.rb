puts 'creating...'

User.create(
  name:'gabriel',
  weight: 90,
  height: 1.85,
  email: 'gbc@gmail.com',
  age: 33,
  gender: 'male',
  password: '123456',
  kilos_to_lose: 5,
  timeline: 3)

puts 'Done!'
