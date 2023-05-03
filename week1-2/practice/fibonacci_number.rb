def fibonacci(n)
  if n==0 || n==1
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

puts fibonacci(0)
puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(7)
puts fibonacci(30)
