require 'faker/japanese'
require 'faker'

def faker(n)
  (1..n).map do
    first_name = Faker::Japanese::Name.first_name
    last_name = Faker::Japanese::Name.last_name
    "姓:#{last_name}\t名:#{first_name}"
  end
end

puts faker(10)
puts Faker::VERSION
