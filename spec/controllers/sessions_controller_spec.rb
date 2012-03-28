require 'spec_helper'

describe SessionsController do
  render_views

  describe "new" do
    it "renders the new template if not logged in" do
      get :new
      response.should render_template(:new)
    end

    it "redirects user if already logged in" do
      @user = Factory.build(:user)
      @user.stubs(:id).returns(5)
      stub_logged_in @user
      get :new
      response.should be_redirect
    end
  end

  describe "create" do
    before(:each) do
      @session = {}
      @user = Factory(:user)
      controller.stubs(:session).returns(@session)
    end

    it "finds their user by email" do
      User.expects(:find_by_email).with(@user.email).returns(@user)
      post :create, :email => @user.email, :password => "password"
    end

    it "authenticates the user" do
      User.expects(:find_by_email).with(@user.email).returns(@user)
      @user.expects(:authenticate).with(@user.password)
      post :create, :email => @user.email, :password => "password"
    end

    context "successful authentication" do

      before(:each) do
        User.expects(:find_by_email).with(@user.email).returns(@user)
        @user.expects(:authenticate).with(@user.password).returns(true)
      end

      it "sets the users id in the session" do
        post :create, :email => @user.email, :password => "password"
        @session[:user_id].should eq(@user.id)
      end

      it "redirects to the users home page" do
        post :create, :email => @user.email, :password => "password"
        response.should redirect_to(user_url(@user))
      end

    end

    context "unsuccessful authentication" do

      before(:each) do
        User.expects(:find_by_email).with(@user.email).returns(@user)
        @user.expects(:authenticate).with(@user.password).returns(false)
      end

      it "does not set the session id" do
        post :create, :email => @user.email, :password => "password"
        @session[:user_id].should be_nil
      end

      it "renders the new template" do
        post :create, :email => @user.email, :password => "password"
        response.should render_template :new
      end

    end

  end

  describe "destroy" do

    before(:each) do
      @session = { :user_id => "banana"}
      controller.stubs(:session).returns(@session)
    end

    it "it destroys the session token" do
      get :destroy
      @session[:user_id].should be_nil
    end

    it 'redirects to the root url' do
      get :destroy
      response.should redirect_to( root_url )
    end

  end

end
