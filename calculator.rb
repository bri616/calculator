def error_check(n)
  # check to see if all values in the string are numeric
  # use regex?
  # returns nil if not composed of just numbers
  # this works if we only accept integers
  # added a condition to accept floats as numeric values

  !n.match(/\A[0-9]+\Z/) and n != "" and !(Float(n) rescue false)

  # find a way without regex?

end

def float_smarts(n)

  if n - n.to_i == 0
    return n.to_i
  else
    return n
  end

end

def check_maths(mathtype)

  acceptable = ['addition', '+', 'subtraction','-', 'multiplication','*','division','/','exponent','^','square root']
  if !acceptable.include? mathtype.downcase
    puts "That is not an acceptable type of maths."
    exit
  end

end

def calculate(f, a=0, b=0)

  if f.downcase == "addition" or f.downcase == "+"
    add(a, b)
  elsif f.downcase == "subtraction" or f.downcase == "-"
    subtract(a, b)
  elsif f.downcase == "multiplication" or f.downcase == "*"
    multiply(a, b)
  elsif f.downcase == "division" or f.downcase == "/"
    divide(a, b)
  elsif f.downcase == "exponent" or f.downcase == "^"
    exponent(a, b)
  elsif f.downcase == "square root"
    squareroot(a)
  else
    nil
  end

end

def squareroot(a)
  return "sqrt(#{float_smarts(a)})", float_smarts(Math.sqrt(a))
end

def exponent(a,b)
  return "#{float_smarts(a)}^#{float_smarts(b)}", float_smarts(a**b)
end

def divide(a, b)
  return "#{float_smarts(a)} / #{float_smarts(b)}", float_smarts(a / b)
end

def multiply(a, b)
  return "#{float_smarts(a)} * #{float_smarts(b)}" , float_smarts(a * b)
end

def add(a, b)
  return "#{float_smarts(a)} + #{float_smarts(b)}",  float_smarts(a + b)
end

def subtract(a, b)
  return "#{float_smarts(a)} - #{float_smarts(b)}", a - b
end

def ask_operation

  puts "What kind of maths would you like to do?"
  input = gets.chomp

  check_maths(input)
  return input

end

def ask_number(nth)

  puts "Give me #{nth} number?"
  num = gets.chomp

  while error_check(num)
    puts "Need a numeric value, try again?"
    num = gets.chomp
  end

  return num.to_f

end

# Here is where the main function starts

puts "Hello there!"

input = ask_operation

num1 = ask_number("a")

# square root doesn't care about num2, but it can't be undefined
num2 = 0

if input.downcase != 'square root'

  num2 = ask_number("another").to_f

end

operation, numans = calculate(input, num1, num2)
answer = "#{operation} = #{numans}"
puts "Wow, your answer is #{answer}"

puts "Would you like to do another calculation on this result? (y/n)"
another_calc = gets.chomp
orig_ans = numans

while another_calc.downcase[0] == "y"

  input = ask_operation
  newnum = 0

  if input.downcase != 'square root'

    newnum = ask_number("a").to_f

  end

  operation, numans = calculate(input, orig_ans, newnum)

  answer = "#{operation} = #{numans}"
  puts "Wow, your answer is #{answer}"

  puts "Would you like to do another calculation on this result? (y/n)"
  another_calc = gets.chomp
  orig_ans = numans

end
