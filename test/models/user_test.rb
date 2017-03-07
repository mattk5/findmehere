require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup 
		@user = User.new(name: "Test User", email: "test@email.com", password: "password", password_confirmation: "password")
	end

	test "user should be valid" do 
		assert @user.valid?
	end

	test "name should be present" do 
		@user.name = "      "
		assert_not @user.valid?
	end

	test "name should not be longer than 55 characters" do 
		@user.name = "y" * 56
	end	

	test "email should be present" do 
		@user.email = "      "
	end

	test "email should not be longer than 255 characters" do 
		@user.email = "y" * 244 + "@example.com"
		assert_not @user.valid?
	end

	test "email address should be unique" do 
		duplicate_user = @user.dup 
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "password should not be blank" do 
		@user.password = @user.password_confirmation = " " * 8
		assert_not @user.valid?
	end

	test "password should be at least 8 characters" do 
		@user.password = @user.password_confirmation = "p" * 7
		assert_not @user.valid?
	end
end
