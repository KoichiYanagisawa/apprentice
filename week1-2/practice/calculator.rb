class NoIntegerError < StandardError
end
class NoMatchOperatorError < StandardError
end
if operator
end

[num1, num2].each do |value|
  if !value.integer?
    raise NoIntegerError
  end
end

def calculate(num1, num2, operator)
  case operator
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    num1 / num2
  else
    raise NoMatchOperatorError
  end
  # 本来、バリデーションの意味でもこっちが前のはず
  # ここは勉強会で共有したい
end

begin
  puts calculate(1, 0, '/')
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
rescue NoIntegerError
  puts "num1、 num2 には整数を入力してください"
rescue NoMatchOperatorError
  puts "演算子には +、-、、/ のいずれかを使用してください"
end

begin
  puts calculate(1.5, 2, '+')
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
rescue NoIntegerError
  puts "num1、 num2 には整数を入力してください"
rescue NoMatchOperatorError
  puts "演算子には +、-、、/ のいずれかを使用してください"
end

begin
  puts calculate(1.5, 2, '**')
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
rescue NoIntegerError
  puts "num1、 num2 には整数を入力してください"
rescue NoMatchOperatorError
  puts "演算子には +、-、、/ のいずれかを使用してください"
end

begin
  puts calculate(5, 2, '*')
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
rescue NoIntegerError
  puts "num1、 num2 には整数を入力してください"
rescue NoMatchOperatorError
  puts "演算子には +、-、、/ のいずれかを使用してください"
end
