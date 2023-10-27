# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Flat.destroy_all

puts "Creating Flats..."
london = {
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guest: 3
}
new_york = {
  name: 'City View Penthouse New York',
  address: '123 Central Park West, New York, NY 10023',
  description: 'Experience the luxury of this penthouse with breathtaking city views. Three bedrooms, a modern open-plan living area, a fully equipped kitchen, and a private rooftop terrace.',
  price_per_night: 300,
  number_of_guest: 6
}

malibu = {
  name: 'Charming Seaside Cottage Malibu',
  address: '456 Ocean Drive, Malibu, CA 90265',
  description: 'A cozy seaside cottage with direct beach access. One bedroom, a comfortable living space, a fully equipped kitchen, and a deck with ocean views.',
  price_per_night: 150,
  number_of_guest: 2
}

paris = {
  name: 'Historic Loft in Paris',
  address: '20 Rue de la Vieille Lanterne, 75004 Paris, France',
  description: 'Immerse yourself in history with this charming loft in the heart of Paris. Two bedrooms, a spacious open-plan living area, a well-equipped kitchen, and unique architectural features.',
  price_per_night: 120,
  number_of_guest: 4
}

[london, new_york, malibu, paris].each do |attributes|
  flat = Flat.create!(attributes)
  puts "Created #{flat.name}"
end

puts "Finished!"
