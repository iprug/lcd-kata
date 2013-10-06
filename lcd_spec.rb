require_relative "lcd"

DIGITS = <<-EOF
 - 
| |
   
| |
 - 
===
   
  |
   
  |
   
===
 - 
  |
 - 
|  
 - 
===
 - 
  |
 - 
  |
 - 
===
   
| |
 - 
  |
   
===
 - 
|  
 - 
  |
 - 
===
 - 
|  
 - 
| |
 - 
===
 - 
  |
   
  |
   
===
 - 
| |
 - 
| |
 - 
===
 - 
| |
 - 
  |
 - 
EOF


describe Lcd do
  (0..9).each do |digit|
    it "displays #{digit}" do
      expected = DIGITS.split("===\n")[digit]
      expect(Lcd.convert(digit)).to eq expected
    end
  end
 
  it "displays two-digit numbers" do
    expected = <<-EOF
     - 
  | | |
       
  | | |
     - 
    EOF
    expect(Lcd.convert(10)).to eq expected
  end
 
  it "displays multiple-digit numbers" do
    expected = <<-EOF
     -   -     
  |   |   | | |
     -   -   - 
  | |     |   |
     -   -     
    EOF
   expect(Lcd.convert(1234)).to eq expected
  end
 
  it "prints a sad face on error" do
    expected = <<-EOF
 - -
  | 
  ^ 
    EOF
    expect(Lcd.convert 'foo').to eq expected
  end
end