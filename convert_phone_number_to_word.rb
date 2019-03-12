class ConvertPhoneNumberToWord

  def word_arrangement_combinations(input)
    digits = input.to_s
    start_time = Time.now
    dictionary_words = {}
    results = {}

    #return empty if number match with below condition
    return [] if digits.nil? || digits.length != 10 || digits.include?('0') || digits.include?('1')

    #letters mapping for given number
    letters_mapping = {
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }

    # Read dictionary file and store all values in a array
    1.upto(16) do |word_size|
      dictionary_words[word_size] = []
    end

    filename = "dictionary.txt"

    # Read and Store dictionary words with length as key
    File.foreach( filename ) do |word|
      next if (length = word.chop.length) < 3
      dictionary_words[length] << word.chop.to_s.downcase
    end

    # mapping the letters for given phone number
    digit_to_words = digits.split('').map{ |digit| letters_mapping[digit] }

    total_number = digit_to_words.length - 1 # total numbers

    #condition for word contain at least 3 char.so, we can split given phone number length into following operation
    # [3], [7]
    # [4], [6]
    # [5], [5]
    # [6], [4]
    # [7], [3]
    (2..total_number - 2).each do |index|
      next if (matrix_1 = digit_to_words[0..index]).length < 3
      next if (matrix_2 = digit_to_words[index + 1..total_number]).length < 3

      combination_of_words_1 = matrix_1.shift.product(*matrix_1).map(&:join) # Get product of arrays #get_combination(matrix_1, dictionary)#
      next if combination_of_words_1.nil?

      combination_of_words_2 = matrix_2.shift.product(*matrix_2).map(&:join)
      next if combination_of_words_2.nil?

      # Compare and storing the matching words in the dictionary
      results[index] = [(combination_of_words_1 & dictionary_words[index+1]), (combination_of_words_2 & dictionary_words[total_number - index])] # get common values from arrays
    end

    #Implement [3], [3], [4] words probablity
    m_1 = digit_to_words[0..2]
    m_2 =  digit_to_words[3..5]
    m_3 = digit_to_words[6..9]

    results[1] = [ (m_1.shift.product(*m_1).map(&:join) & dictionary_words[3]),
                   (m_2.shift.product(*m_2).map(&:join) & dictionary_words[3]),
                   (m_3.shift.product(*m_3).map(&:join) & dictionary_words[4])
                 ]

    #arrange words like we need as a output
    compination_of_words = []
    results.each do |key, combinataions|
      next if combinataions.first.nil? || combinataions.last.nil?
      combinataions = combinataions.size > 2 ? (combinataions.first.product combinataions[1], combinataions[2]) : (combinataions.first.product(combinataions.last))

      combinataions.each do |combo_words|
        compination_of_words << combo_words
      end
    end

    # for given numbers
    compination_of_words << (digit_to_words.shift.product(*digit_to_words).map(&:join) & dictionary_words[10]).join(", ") # matche with all character
    end_time = Time.now
    puts "Time #{end_time.to_f - start_time.to_f}"
    compination_of_words
  end

end
