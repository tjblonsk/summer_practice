require 'spec_helper'
require 'question'

describe "insertion sort" do

  it "should return an empty array if empty" do
    Question.insertion_sort([]).should == []
  end

  it "should sort a 1 element array" do
    Question.insertion_sort([1]).should == [1]
  end

  it "should sort a 2 element array" do
    Question.insertion_sort([2,1]).should == [1,2]
  end

  it "should sort a 3 element array" do
    Question.insertion_sort([2,3,1]).should == [1,2,3]
  end

  it "should sort an array with duplicate elements" do
    Question.insertion_sort([2,3,2,3,1]).should == [1,2,2,3,3]
  end

  it "should sort this random array" do
    items = [18, 12, 4, 26, 1, 13, 15, 87, 23, 11, 8, 21, 27]
    Question.insertion_sort(items).should == [1, 4, 8, 11, 12, 13, 15, 18, 21, 23, 26, 27, 87]
  end

end

describe "bubble sort" do

  it "should return an empty array if empty" do
    Question.bubble_sort([]).should == []
  end

  it "should sort a 1 element array" do
    Question.bubble_sort([1]).should == [1]
  end

  it "should sort a 2 element array" do
    Question.bubble_sort([2,1]).should == [1,2]
  end

  it "should sort a 3 element array" do
    Question.bubble_sort([2,3,1]).should == [1,2,3]
  end

  it "should sort an array with duplicate elements" do
    Question.bubble_sort([2,3,2,3,1]).should == [1,2,2,3,3]
  end

  it "should sort this random array" do
    items = [18, 12, 4, 26, 1, 13, 15, 87, 23, 11, 8, 21, 27]
    Question.bubble_sort(items).should == [1, 4, 8, 11, 12, 13, 15, 18, 21, 23, 26, 27, 87]
  end


end

describe "quick sort" do

  it "should sort the array in ascending order" do

    items = [18, 12, 4, 26, 1, 13, 15, 87, 23, 11, 8, 21, 27]
    Question.quick_sort(items, 0, items.length - 1).should == [1, 4, 8, 11, 12, 13, 15, 18, 21, 23, 26, 27, 87]

  end

end

describe "fizz buzz" do

  before(:each) do
    @arr = Question.fizz_buzz
  end

  it "should ouput Fizz for multiples of 3" do
    @arr[8].should == 'Fizz'
  end

  it "should output Buzz for multiples of 5" do
    @arr[9].should == 'Buzz'
  end

  it "should output FizzBuzz for numbers both multiple of 3 and 5" do
    @arr[89].should == 'FizzBuzz'
  end

end


describe "Twitter API" do

  it "should return a properly formatted array with Twitter data" do
    arr = Question.parse_twitter_response

    arr[0].should have_key(:username)
    arr[0].should have_key(:created_at)
    arr[0].should have_key(:body)
    arr[0][:body].should =~ /WunWun/

  end

end
