require 'test_helper'

class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  setup do
    @<%= nested_parent_name %> = <%= plural_nested_parent_name %>(:one)
    @<%= singular_table_name %> = <%= table_name %>(:one)
  end

  test "should get index" do
    get :index, :<%= nested_parent_id %> => @<%= nested_parent_name %>
    assert_response :success
    assert_not_nil assigns(:<%= table_name %>)
  end

  test "should get new" do
    get :new, :<%= nested_parent_id %> => @<%= nested_parent_name %>
    assert_response :success
  end

  test "should create <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count') do
      post :create, :<%= nested_parent_id %> => @<%= nested_parent_name %>, :<%= singular_table_name %> => @<%= singular_table_name %>.attributes
    end

    assert_redirected_to <%= nested_parent_name %>_<%= singular_table_name %>_path(@<%= nested_parent_name %>, assigns(:<%= singular_table_name %>))
  end

  test "should show <%= singular_table_name %>" do
    get :show, :<%= nested_parent_id %> => @<%= nested_parent_name %>, :id => @<%= singular_table_name %>.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :<%= nested_parent_id %> => @<%= nested_parent_name %>, :id => @<%= singular_table_name %>.to_param
    assert_response :success
  end

  test "should update <%= singular_table_name %>" do
    put :update, :<%= nested_parent_id %> => @<%= nested_parent_name %>, :id => @<%= singular_table_name %>.to_param, :<%= singular_table_name %> => @<%= singular_table_name %>.attributes
    assert_redirected_to <%= nested_parent_name %>_<%= singular_table_name %>_path(@<%= nested_parent_name %>, assigns(:<%= singular_table_name %>))
  end

  test "should destroy <%= singular_table_name %>" do
    assert_difference('<%= class_name %>.count', -1) do
      delete :destroy, :<%= nested_parent_id %> => @<%= nested_parent_name %>, :id => @<%= singular_table_name %>.to_param
    end

    assert_redirected_to <%= nested_parent_name %>_<%= index_helper %>_path(@<%= nested_parent_name %>)
  end
end
