require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(
			name: "Testing User", 
			email: "user@testing.com",
			password: "foobar",
			password_confirmation: "foobar"
			);
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "nama harus ada" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "email harus ada" do
		@user.email = "     "
		assert_not @user.valid?
	end

	test "email harus unik" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

	test "email harus lowercase" do
		mixed_case_email = "FooBAR@exAmpLE.COM"
		@user.email = mixed_case_email
		@user.save
		assert_equal mixed_case_email.downcase, @user.reload.email
	end

	test "password harus diisi" do
		@user.password = @user.password_confirmation = "   "
		assert_not @user.valid?
	end

end
