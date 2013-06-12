begin
  
  File.open(ARGV[0]).each_line do |line|
    
    # Expects 3 4 5
    # source_numbers = line.split

    # Fizz Number
    # a = source_numbers[0].to_i

    # Buzz Number
    # b = source_numbers[1].to_i

    # Total Count Number
    # n = source_numbers[2].to_i

    # Un-FizzBuzzed
    # result_numbers = (1...(n+1)).to_a
    
    # FizzBuzzed Each   
    # result_numbers.each_with_index{|x, y|
    #   if x % a + x % b == 0
    #     result_numbers[y] = 'FB'
    #   elsif x % a == 0
    #     result_numbers[y] = 'F'
    #   elsif x % b == 0
    #     result_numbers[y] = 'B'
    #   end
    # }
    
    # FizzBuzzed Map
    # result_numbers.map!{|x|
    #   if x % a + x % b == 0
    #     x = 'FB'
    #   elsif x % a == 0
    #     x = 'F'
    #   elsif x % b == 0
    #     x = 'B'
    #   else 
    #     x
    #   end
    # }

    # FizzBuzzed Less
    # puts result_numbers.map!{|x|
    #   y = x
    #   x = ''
    #   x += 'F' if y % a == 0
    #   x += 'B' if y % b == 0
    #   x.empty? ? y : x
    # }.join(" ")
    
    # FizzBuzzed
    # puts result_numbers.join(" ")

    # FizzBuzzed Ultra
    puts (1...(line.split[2].to_i+1)).to_a.map!{|x|
      y = x
      x = ''
      x += 'F' if y % line.split[0].to_i == 0
      x += 'B' if y % line.split[1].to_i == 0
      x.empty? ? y : x
    }.join(" ")

  end

end