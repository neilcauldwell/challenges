# Loremipsumwordsource

## Objective

A WordSource is a source of words that keeps analytics of each word that it has seen.

1. Implement LorumIpsumWordSource
2. Get top 5 consonants from the words seen
3. Get top 5 words

## Outstanding

4. Add callbacks on specific words e.g. every time "semper" is encountered, call the callbacks linked to "semper"
5. implement twitter search API as src for the Loremipsumwordsource

## Result

    src = Loremipsumwordsource::Client.new('./spec/fixture/lorem_ipsum.txt')
    src.next_word
     # => "lorum"
    src.next_word
     # => "ipsum"
    src.next_word
     # => "ipsum"
    src.top_5_words
     # => ["ipsum","lorum",nil,nil,nil]
    src.top_5_consonants
     # => ["m","p","s","l","r"]
