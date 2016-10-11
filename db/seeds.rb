Event.destroy_all

p "Seeding Data....!"

events = { Karachi: Time.now + 2.days, Lahore: Time.now + 1.month, Islamabad: Time.now + 1.day }

events.each do |venue, date_time|
  Event.create(
  name:"#{venue} Event",
  description: "Simple Example form seed.rb organized at #{venue}",
  venue: venue,
  seats: rand(100..250),
  date_time: date_time
  )
end

p "Done...!"
