require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Sports')
  end
  
  test "Category Valid" do
    assert @category.valid?
  end
  
  test "Name Present" do
    @category.name = ' '
    assert_not @category.valid?
  end
  
  test "Name Is Unique" do
    @category.save
    category2 = Category.new(name: "Sports")
    assert_not category2.valid?
  end
  
  test "Name is less than 25 characters" do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end
  
  test "Name is more than 2 characters" do
    @category.name = 'aa'
    assert_not @category.valid?
  end
end