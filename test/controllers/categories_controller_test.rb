require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "johnny", 
                        email: "johnny@example.com",
                        password: "password",
                        admin: true)
  end
  
  test "Get Categories Index" do
    get categories_path
    assert_response :success
  end
  
  test "Get New Category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end
  
  test "Get Show Category" do
    get category_path(@category)
    assert_response :success
  end
  
  test "Should redirect create when not admin" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name: "sports" }}
    end
    assert_redirected_to categories_path
  end
end