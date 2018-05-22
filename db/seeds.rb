# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
Dog.delete_all
%w[max charlie cooper buddy jack tucker rocky bella lucy daisy molly sadie molly].each do |name|
  Dog.create!(
    name: name,
    owner: Faker::Name.name,
    sniffed_butts: (0..100).to_a.sample
  )
end

Dog.create!(
  name: "Luna",
  owner: "Gal Tsubery",
  sniffed_butts: 9001
)
