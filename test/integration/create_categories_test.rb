require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "Get new Cateogry Form and Create Category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name: "Sports"}} 
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'Sports', response.body
  end
  
  test "Invalid Category Submission Results in Failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name: ""}} 
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end