require 'spec_helper'

describe User do

	context "validations" do

		before(:each) do
			@user = Factory.build(:user)
    end

		it 'it starts out valid' do
			@user.should be_valid
      @user.save
      @user.errors.each do |x|
           x.each do |y|
             puts y

        end
      end
		end

		it 'must have a email' do
			@user.email = nil
			@user.should_not be_valid
		end

		it 'must have a full name' do
			@user.full_name = nil
			@user.should_not be_valid
		end

		it 'must have well formatted name' do
			@user.full_name = '123456$%#'
			@user.should_not be_valid
		end

		it 'must have name that is at least 3 characters' do
			@user.full_name = 'ba'
			@user.should_not be_valid
		end

		it 'must have a well formatted email' do
			@user.email = "banana"
			@user.should_not be_valid
		end

		it 'must have a unique email' do
			@user.save.should be_true
			user2 = User.new(:full_name => "matthew robert", :email => @user.email)
			user2.should_not be_valid
		end

		it 'should start out as not an admin by default' do
			User.new.admin?.should be_false
		end

		it 'should not allow admin flag to be changed by mass assignment' do
			# this is to close a security hole in the app and is not really a 
			# validation thing. Try googling 'attribute_accessible' to figure out
			# how to get the spec to pass
			@user.admin = false
			@user.save
			@user.update_attributes(:admin => true)
			@user.admin?.should be_false
		end


		it 'must have password that is at least 6 characters' do
			@user.password = "dhs"
			@user.should_not be_valid
		end

		# stuff below here will be handled by Srikanth

    it 'must confirm its password exactly' do
			@user.password = "password"
			@user.password_confirmation = "passw0rd"
			@user.should_not be_valid
		end

	end

	context 'authentication system'  do
		before(:each) do
			@user = Factory(:user)
			@user.save
		end

		it 'should return a user if password is correct' do
			@user.authenticate( "password" ).should eq @user
		end

		it 'should return FALSE if password is incorrect' do
			@user.authenticate( "passw0rd" ).should be_false
    end

    it 'should create a password digest when saved' do
      @user = Factory.build(:user)
      #@user.password_digest.should be_nil
      @user.save
      @user.password_digest.should_not be_nil
    end
	end
  
end
