# Seed Facilities
facilities = []
50.times do |i|
  facilities << Facility.create(
    name: "Facility #{i + 1}",
    description: "Description for Facility #{i + 1}",
    location: "Location #{i + 1}",
    sports: "Sports #{i + 1}",
    pincode: "#{rand(10000..99999)}"
  )
end

# Seed Users
users = []
50.times do |i|
  users << User.create(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    password: 'password'
  )
end

# Seed Bookings
bookings = []
50.times do |i|
  bookings << Booking.create(
    user: users.sample,
    facility: facilities.sample,
    date: Date.today + rand(1..30),
    slot: rand(1..24)
  )
end

puts 'Seed data created successfully!'
