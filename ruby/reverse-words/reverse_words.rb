begin

  File.open(ARGV[0]).each_line do |line|
    words = line.split.reverse
    unless words.empty?
      puts words.join(" ")
    end
  end

end