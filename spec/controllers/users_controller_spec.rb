require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
      controller.stubs(:is_logged_in)
  end
    
  describe "index" do

    it "renders index template" do
      get :index
      response.should render_template(:index)
    end

    it 'loads all the users' do 
      User.expects(:all).returns([])
      get :index
      assigns(:user).should_not eq([])
    end

  end

  describe "show" do

    before(:each) do
      @user = Factory(:user)
      @stub = []
      @stub.stubs(:all).returns([])
      User.stubs(:find).returns(@user)
    end


    it "renders show template" do
      get :show, :id => "33" 
      response.should render_template(:show)
    end

    it "finds and assigns the user" do
      get :show, :id => "33" 
      assigns(:user).should eq(@user)
    end

    it 'assigns the users managed projects' do
      @user.expects(:owned_projects).returns(@stub)
      get :show, :id => "33" 
      assigns(:managed_projects).should eq []
    end

    it 'assigns the users contributing projects' do
      @user.expects(:projects).returns(@stub)
      get :show, :id => "33" 
      assigns(:contrib_projects).should eq []
    end

  end

  describe "new" do

    it "creates a new user and assigns is" do
      get :new
      assigns(:user).should_not be_nil
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

  end

  describe "create" do
    it "create action should render new template when model is invalid" do
      User.any_instance.stubs(:valid?).returns(false)
      post :create 
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      User.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(user_url(assigns[:user]))
    end
    
    it "create action should set the sessions when model is valid" do
      User.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(user_url(assigns[:user]))
    end
  end

  describe "edit" do
    
    before(:each) do
      @user = Factory.build(:user)
      User.stubs(:find).returns(@user)
    end

    it "renders edit template" do
      get :edit, :id => "33"
      response.should render_template(:edit)
    end
  end

  describe "update" do

    before(:each) do
      @user = Factory(:user)
    end

    it "update action should render edit template when model is invalid" do
      User.any_instance.stubs(:valid?).returns(false)
      put :update, :id => @user.id
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      User.any_instance.stubs(:valid?).returns(true)
      put :update, :id => @user.id
      response.should redirect_to(user_url(:id => @user.id))
    end

  end

  describe "destroy" do

    before(:each) do
      @user = Factory(:user)
    end

    it "destroys the model" do
      delete :destroy, :id => @user.id
      response.should redirect_to(users_url)
      User.exists?(@user.id).should be_false
    end

    it 'redirects to the index action' do
      delete :destroy, :id => @user.id
      response.should redirect_to(users_url)
    end

  end

end
