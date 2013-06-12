#!/usr/bin/env ruby
require "thor"
require "thor/group"
require "terminal-table"

module Multi
  module Prime
    module Table
      class Run < Thor::Group
        argument :total, :type => :numeric, :desc => "The amount of prime numbers to generate", :default => 10
        desc "Creates a multiplication table from prime numbers"

        #
        def generate_table

          # Grab total amount of prime numbers
          prime_numbers = generate_prime_numbers(total)

          # Clone the prime_numbers, then unshift ( as to not have the headings first column full )
          headings = prime_numbers.clone.unshift("")

          # Create a terminal-table
          table = Terminal::Table.new :headings => headings, :title => "Generate #{total} prime numbers in a table" do |t|

            # For each prime number, create a row
            prime_numbers.length.times do |x|

              # Start each row with the prime number
              row = [prime_numbers[x]]

              # For each prime number, calculate the value of them multiplied
              prime_numbers.length.times do |y|
                row << prime_numbers[x] * prime_numbers[y]
              end

              # Add the row as well as a seperator for every row, except the last
              t << row
              t << :separator unless x == (prime_numbers.length - 1)

            end

          end

          # Generate the output
          puts table

        end

        private

          # Not as optimised as using Prime.take but will suffice
          #
          # @return [Array]
          def generate_prime_numbers(amount = 10)

          #
          prime_numbers = []
          prime_index = 0

          # Recursivly generate prime_numbers untill the amount is reached
          until prime_numbers.length == amount
            prime_index = next_prime(prime_index)
            prime_numbers << prime_index
          end

          #
          return prime_numbers

          end

          # Returns the next prime number from the givern input
          #
          # @return [Number]
          def next_prime(n)

            #
            prime_number = n + 1

            #
            until is_prime? prime_number do
              prime_number += 1
            end

            #
            return prime_number

          end

          # Is the number a prime one?
          #
          # @return [Boolean]
          def is_prime?(n)

            #
            return false if n <= 1

            #
            (2..Math::sqrt(n)).each do |x|
              return false if n % x == 0
            end

            #
            return true

          end

      end
    end
  end
end

# Runs
Multi::Prime::Table::Run.start