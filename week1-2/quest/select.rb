def select_even_numbers(numbers)
  numbers.select(&:even?)
end

even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print even_numbers
