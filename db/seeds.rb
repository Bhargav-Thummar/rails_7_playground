# puts "\n== Seeding the database with fixtures =="
# system("bin/rails db:fixtures:load")

Quote.destroy_all

[
  "First", 
  "Second",
  "Third",
  "Fourth",
  "Fifth",
  "Sixth"
].each.with_index(1) do |v, i|
  quote = 
    Quote.find_or_create_by(
      name: "#{v} Quote."
    )

  comments = 
    [
      { body: "quote-#{i}: comment 1" },
      { body: "quote-#{i}: comment 2" },
      { body: "quote-#{i}: comment 3" },
      { body: "quote-#{i}: comment 4" },
      { body: "quote-#{i}: comment 5" },
      { body: "quote-#{i}: comment 6" },
    ]

  quote.comments.create!(comments)
end