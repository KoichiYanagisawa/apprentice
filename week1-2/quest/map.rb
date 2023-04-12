def square(numbers)
  numbers.map do |number|
    number ** 2
  end
end



squared_numbers = square([5, 7, 10])
print squared_numbers
