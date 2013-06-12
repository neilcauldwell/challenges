begin
  
  File.open(ARGV[0]).each_line do |line|

    # Grab all the operators
    opperators = line.scan( /[*+\/]/)
    
    # Grab all the numbers ( I'm assuming this is everything but the opperators )
    numbers = line.scan( /[^\s*+\/]/)
    
    # It would seem that the operators are executed in reverse order...
    opperators.reverse!

    # Tested out ways to 'eval' a string of numbers and opperators. eval seemed the best choice
    
    # puts numbers[0].to_i.send opperators[0], numbers[1].to_i
    # puts eval(numbers[0] + opperators[0] + numbers[1])

    # Went down the route of trying add up numbers untill the end
    # Only to relise a little recursion was the trick
    # total = 0
    # numbers.each_with_index {|x,y|
    #   total += eval(x.to_s + opperators[y].to_s + numbers[y+((y == numbers.length) ? 0 : 1)].to_s)
    #   puts total
    # }
    # puts total

    #
    # Prefix expresssion
    #
    # Will recursivly loop through all numbers choosing using its index to select the operator
    # This assumes ( from what I can tell in the example ) that there is never more opperators than numbers...
    numbers.each_with_index {|x,y| 

      target = numbers.shift(2)
      numbers.unshift(eval(target[0].to_s + opperators[y].to_s + target[1].to_s))
    }

    puts numbers[0].to_s

  end

end