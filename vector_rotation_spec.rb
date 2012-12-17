require 'rubygems'
require 'rspec'
require 'vector_rotations'

describe Vector_rotation do
  it "should rotate the vector by 5 charaters" do
    result = Vector_rotation.rotate("1234567890", 5)
    result.should == "6789012345"
  end
  it "should rotate the vector by 4 charaters" do
    Vector_rotation.rotate("1234567890", 4).should == "5678901234"
  end

  it "should return blank string if word is empty" do
    Vector_rotation.rotate("", 5).should == ""
  end
  it "should reverse a two character string if rotated by 1 char" do
    Vector_rotation.rotate("ab", 1).should == "ba" 
  end
  it "should be unchanged if num is 0" do
    Vector_rotation.rotate("12345", 0).should == "12345"
  enda
end
