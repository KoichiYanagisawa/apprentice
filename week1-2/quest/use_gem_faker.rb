require 'faker/japanese'

def faker(n)
  (1..n).map {
    first_name = Faker::Japanese::Name.first_name
    last_name = Faker::Japanese::Name.last_name
    "姓：#{last_name}\t名：#{first_name}"
  }
end

puts faker(10)
