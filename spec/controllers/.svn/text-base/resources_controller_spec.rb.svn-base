require 'spec_helper'

describe ResourcesController do
  render_views
  
  before(:each) do
      controller.stubs(:is_logged_in)
  end
  
  describe "index" do

    it "renders index template" do
      get :index
      response.should render_template("index")
    end

    it 'loads all the resources' do 
      Resource.expects(:all).returns([])
      get :index
      assigns(:resource).should_not eq([])
    end

  end  
 

  describe "show" do

   before(:each) do
      @resource = Factory(:resource)
      @stub = []
      @stub.stubs(:all).returns([])
      Resource.stubs(:find).returns(@resource)
    end

    it "renders show template" do
      get :show, :id => "21"
      response.should render_template(:show)
    end

   it "finds and assigns the resource" do
      get :show, :id => "21" 
      assigns(:resource).should eq(@resource)
    end
    
  end

  
  describe "new" do

    it "creates a new resource and assigns is" do
      get :new
      assigns(:resource).should_not be_nil
    end
 
    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
  end

 
  describe "create" do
    it "should render new template when model is invalid" do
      Resource.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "should redirect when model is valid" do
      Resource.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(resource_url(assigns[:resource]))
    end
  end

  
  describe "edit" do

    before(:each) do
      @resource = Factory.build(:resource)
      Resource .stubs(:find).returns(@resource)
    end

    it "should render edit template" do
      get :edit, :id => "21"
      response.should render_template(:edit)
    end
  end

  describe "update" do

  before(:each) do
      @resource = Factory(:resource)
    end

    it "should render edit template when model is invalid" do
      Resource.any_instance.stubs(:valid?).returns(false)
      put :update, :id => @resource.id
      response.should render_template(:edit)
    end

    it "should redirect when model is valid" do
      Resource.any_instance.stubs(:valid?).returns(true)
      put :update, :id => @resource.id
      response.should redirect_to(resource_url(assigns[:resource]))
    end
  end

  
  describe "destroy" do

   before(:each) do
      @resource = Factory(:resource)
    end

    it "destroy the model " do

      delete :destroy, :id => @resource.id
      response.should redirect_to(resources_url)
      Resource.exists?(@resource.id).should be_false
    end

    it 'redirects to the index action' do
      delete :destroy, :id => @resource.id
      response.should redirect_to(resources_url)
    end
  end

end
