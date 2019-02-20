require "application_system_test_case"

class <%= class_name.pluralize %>Test < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit <%= nested_parent_name%>_<%= plural_table_name %>_url
  #
  #   assert_selector "h1", text: "<%= class_name %>"
  # end
end
