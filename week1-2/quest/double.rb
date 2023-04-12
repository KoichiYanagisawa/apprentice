def input_double
  print "好きな数値を入力してください:"

  value = gets.to_i * 2
  puts "2倍の数値です:#{value}"
end

input_double
