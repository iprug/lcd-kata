class Lcd  
  DIGITS = [
      " - \n| |\n   \n| |\n - \n",
      "   \n  |\n   \n  |\n   \n",
      " - \n  |\n - \n|  \n - \n",
      " - \n  |\n - \n  |\n - \n",
      "   \n| |\n - \n  |\n   \n",
      " - \n|  \n - \n  |\n - \n",
      " - \n|  \n - \n| |\n - \n",
      " - \n  |\n   \n  |\n   \n",
      " - \n| |\n - \n| |\n - \n",
      " - \n| |\n - \n  |\n - \n",
  ]
  
  def self.convert number
    return sad_face unless number.is_a? Integer
    display_digits = split_digits(number).map {|digit| convert_digit digit }

    get_row(0, display_digits)  + "\n" +
    get_row(1, display_digits)  + "\n" +
    get_row(2, display_digits)  + "\n" +
    get_row(3, display_digits)  + "\n" +
    get_row(4, display_digits)  + "\n"
  end
  
  def self.convert_digit digit
    DIGITS[digit]
  end
  
  def self.split_digits number
    number.to_s.chars.map(&:to_i)
  end
  
  def self.get_row line_num, digits
    digits.map{|digit| digit.split("\n")[line_num]}.join ' '
  end
  
  def self.sad_face
    <<-EOSADFACE
 - -
  | 
  ^ 
    EOSADFACE
  end
end