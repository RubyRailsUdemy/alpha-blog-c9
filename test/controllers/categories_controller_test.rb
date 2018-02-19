require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
  end
  
  test "Get Categories Index" do
    get categories_path
    assert_response :success
  end
  
  test "Get New Category" do
    get new_category_path
    assert_response :success
  end
  
  test "Get Show Category" do
    get category_path(@category)
    assert_response :success
  end
end