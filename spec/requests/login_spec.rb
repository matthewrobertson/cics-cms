require 'spec_helper'

describe 'the log in process' do
  
  before(:each) do
    @user = Factory(:user)
    visit login_url

  end
  
  it 'has a link to the sign up page' do
    page.should have_content "sign up" 
    click_link "sign up"
    current_path.should eq(new_user_path)
  end 
  
  it 'redirects a user to thier dashboard after login' do
    fill_in :email, :with => @user.email
    fill_in :password, :with => "password"
    click_button "Log in"
    current_path.should == projects_path
  end
  
  it 'informs the user if thier log in credentials are incorrect' do
    fill_in :email, :with => @user.email
    fill_in :password, :with => @user.password
    click_button "Log in"
    page.should have_content "Invalid email or password" 
  end
  
end
