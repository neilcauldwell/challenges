begin

	# Lets reverse the array to sort by largest first!
	puts 1000.downto(2).find { |n|
		# Check for prime palindrome
		(n.to_s.reverse == n.to_s) && (2..Math.sqrt(n)).none? { |d|
			(n % d == 0)
		}
	}
	
end