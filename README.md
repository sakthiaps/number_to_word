Convert given phone number to combination of words
The phone number mapping to letters is as follows:

2 = a b c
3 = d e f
4 = g h i
5 = j k l
6 = m n o
7 = p q r s
8 = t u v
9 = w x y z
 
The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.
Steps:
1. return empty if number match with below condition
    digits.nil? || digits.length != 10 || digits.include?('0') || digits.include?('1')
 
 2. letters mapping as key => value pair
 3. Read dictionary file and store all values in a array
 4. Not store the word length is less than 3
 5. Mapping the letters for given phone number
 6. condition for word contain at least 3 char.so, we can split given phone number length into following operation
    # [3], [7]
    # [4], [6]
    # [5], [5]
    # [6], [4]
    # [7], [3]
    # [3],[3],[4]
 7. Compare and storing the matching words in the dictionary
 8. Arrange words like expected output
 9. Convert the given digit to words for given whole number and added to possiblity words array
 10. Return combination of words at finally.


Running Command:
1. loading the file using load command
  ```load"file_path"```
2. run the  ```ConvertPhoneNumberToWord.new.word_arrangement_combinations(6686787825)```
3. You can run with different solution, replace the given number to your input number when run with different number
