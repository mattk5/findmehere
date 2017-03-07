require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "header links" do 
		get root_path
		assert_template 'pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", about_path
		assert_select "a[href=?]", contact_path
	end
end
