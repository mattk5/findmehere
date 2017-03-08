require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
 	
 	test "login with valid credentials" do 
 		get login_path
 		post login_path, params: { session: { email: @user.email, password: 'password' } }
 		assert is_logged_in?
 		assert_redirected_to @user 
 		follow_redirect!
 		
 	end
end	
