require_relative "FixedPointNumber.rb"

@fpn_list = []
@q_value = 12

def run
  string = ""
  while string != "X"
    string = gets.chomp
    if string[0].upcase == "A"
      a_method(string[2..-1].to_f)
    elsif string[0].upcase == "D"
      d_method(string[2..-1].to_f)
    elsif string[0].upcase == "P"
      p_method
    elsif string[0].upcase == "Q"
      q_method(string[2..-1].to_f)
    elsif string[0].upcase == "S"
      s_method
    elsif string[0].upcase == "X"
      x_method
    else
      value = string[0]
      puts "#{value} is not a valid command!"
    end
  end
end

def a_method(dbn)
  new_fpn = FixedPointNumber.new(dbn,@q_value)
  @fpn_list.push(new_fpn)
  puts "#{new_fpn} was added to the list."
end

def d_method(dbn)
  new_fpn = FixedPointNumber.new(dbn,@q_value)
  if @fpn_list.include?(new_fpn)
    @fpn_list.delete(new_fpn)
  end
  puts "#{new_fpn} was deleted from the list."
end

def p_method
  puts "All fixed-point numbers in the list are:"
  @fpn_list.each do |fpn|
    puts fpn
  end
end

def q_method(num)
  @q_value = num.to_i
  puts "Current q_value was changed to #{num}."
end

def s_method
  sum = 0
  @fpn_list.each do |fpn|
    sum += fpn.to_double
  end
  fpn = FixedPointNumber.new(sum,@q_value)
  puts "The sum is #{fpn}"
end

def x_method
  puts "Normal termination of program 1."
end

#run the file
run