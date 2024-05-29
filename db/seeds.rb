# Seed Facilities
facilities = Facility.create([
  {
    name: 'Football',
    description: 'State-of-the-art sports complex with various facilities',
    location: '123 Main Street, CityA',
    sports: 'Football',
    pincode: '12345'
  },
  {
    name: 'Tennis',
    description: 'Professional tennis courts with coaching services',
    location: '456 Park Avenue, CityB',
    sports: 'Tennis',
    pincode: '67890'
  },
  {
    name: 'Gym',
    description: 'Fully-equipped gym for fitness enthusiasts',
    location: '789 Elm Street, CityC',
    sports: 'Gym',
    pincode: '54321'
  }
])

# Seed Users
users = User.create([
  { name: 'John Doe', email: 'john@example.com', password: 'password' },
  { name: 'Jane Doe', email: 'jane@example.com', password: 'password' },
  { name: 'Alice Smith', email: 'alice@example.com', password: 'password' }
])

# Seed Bookings
bookings = Booking.create([
  { user: users[0], facility: facilities[0], date: Date.today, slot: 10 },
  { user: users[1], facility: facilities[1], date: Date.today + 1, slot: 14 },
  { user: users[2], facility: facilities[2], date: Date.today + 2, slot: 18 }
])

puts 'Seed data created successfully!'
