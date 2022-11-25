puts "clearing all users, listings and bookings..."

User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts "creating the four mangos as users..."

oliver = User.create!({
    email: "oliver@lewagon.com",
    password: "lewagon",
    address: "Löwenplatz, Luzern",
    name: "Oliver",
    phone: "44719999991"
  }
)

ioannis = User.create!({
    email: "ioannis@lewagon.com",
    password: "lewagon",
    address: "Badenerstrasse, 8048 Zürich",
    name: "Ioannis",
    phone: "0745935921"
  }
)

marlin = User.create!({
    email: "marlin@lewagon.com",
    password: "lewagon",
    address: "Verenastrasse, Zürich",
    name: "Marlin",
    phone: "0792103862"
  }
)

omar = User.create!({
    email: "omar@lewagon.com",
    password: "lewagon",
    address: "Bahnhofstrasse, Zürich",
    name: "Omar",
    phone: "0764921653"
  }
)

puts "created users!"
puts "creating 2 listings per user..."

listing1 = Listing.create!({
  name: "Electric drill with swiss plug",
  description: "Plug drill straight in to mains for EXTRA POWER!!! Will go through absolutely anything (except metal, diamond and other precious stones)",
  price_per_hour: 5,
  location: "Löwenplatz, Luzern",
  user_id: oliver.id,
  category_type: "Electronic"
})

listing2 = Listing.create!({
  name: "Workbench available",
  description: "Workbench includes sander, disc saw and plenty of tools - open to use but must provide own materials",
  price_per_hour: 10,
  location: "Mozartstrasse, Luzern",
  user_id: oliver.id,
  category_type: "Electronic"
})

listing3 = Listing.create!({
  name: "Spirit level",
  description: "Wonky shelves no longer - borrow my spirit level(s) - come in various sizes",
  price_per_hour: 3.50,
  location: "Zürcherstrasse, 8952 Zürich",
  user_id: ioannis.id,
  category_type: "Electronic"
})

listing4 = Listing.create!({
  name: "Cat nail clippers",
  description: "My Scottish Fold hates these... available to borrow and stop your crazy cat scratching you!",
  price_per_hour: 2,
  location: "Zürcherstrasse, 8952 Zürich",
  user_id: ioannis.id,
  category_type: "Electronic"
})

listing5 = Listing.create!({
  name: "Electric hammer",
  description: "Does your hand hurt from too much manual hammering? Homer Simpson has invented an electric hammer to save your fingers!!",
  price_per_hour: 2,
  location: "Verenastrasse, Zürich",
  user_id: marlin.id,
  category_type: "Electronic"
})

listing6 = Listing.create!({
  name: "Electric bicycle pump",
  description: "Electric pump available to pump up your tyres! Comes with pressure dial and multiple valve connectors",
  price_per_hour: 10,
  location: "Verenastrasse, Zürich",
  user_id: marlin.id,
  category_type: "Electronic"
})

listing7 = Listing.create!({
  name: "Welding Helmet",
  description: "Keep your sight with this welding helmet. Prevents electricity getting in to your eyeballs which isn't recommended - trust me!!",
  price_per_hour: 20,
  location: "Bahnhofstrasse, Zürich",
  user_id: omar.id,
  category_type: "Electronic"
})

listing8 = Listing.create!({
  name: "Robot computer chip",
  description: "Put this computer chip in any electrical appliance to see it come to life!! Comes with emergency deactivation button in case of robot rebellion... Yes I've watched iRobot",
  price_per_hour: 50,
  location: "Bahnhofstrasse, Zürich",
  user_id: omar.id,
  category_type: "Electronic"
})

puts "created listings!"
puts "creating a few bookings..."

Booking.create!({
  start_date: Date.new(2022,11,28),
  end_date: Date.new(2022,11,28),
  listing_id: listing8.id,
  user_id: oliver.id
})

Booking.create!({
  start_date: Date.new(2022,12,9),
  end_date: Date.new(2022,12,15),
  listing_id: listing5.id,
  user_id: omar.id,
  status: "confirmed"
})

Booking.create!({
  start_date: Date.new(2023,2,3),
  end_date: Date.new(2023,2,6),
  listing_id: listing6.id,
  user_id: ioannis.id
})

Booking.create!({
  start_date: Date.new(2023,2,25),
  end_date: Date.new(2023,2,26),
  listing_id: listing1.id,
  user_id: marlin.id
})

puts "FINISHED!"
