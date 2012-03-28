require 'spec_helper'

describe AnnouncementsController do

  render_views

  before(:each) do
      controller.stubs(:is_logged_in)
  end
  
  describe "index" do
    it "renders index template" do
      get "index"
      response.should render_template(:index)
    end
   it 'loads all the announcements' do 
      Announcement.expects(:all).returns([])
      get :index
      assigns(:announcement).should_not eq([])
    end
  end

  describe "show" do
    before(:each) do
      @announcement = Factory(:announcement)
      @stub = []
      @stub.stubs(:all).returns([])
      Announcement.stubs(:find).returns(@announcement)
    end
    it "renders show template" do
      get :show, :id => "10"
      response.should render_template(:show)
    end
    it "finds and assigns the announcement" do
      get :show, :id => "10" 
      assigns(:announcement).should eq(@announcement)
    end
  end

  describe "new" do
    it "creates a new announcement and assigns is" do
      get :new
      assigns(:announcement).should_not be_nil
    end
    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "create" do
    it "renders new template when model is invalid" do
      Announcement.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "redirect when model is valid" do
      Announcement.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(announcement_url(assigns[:announcement]))
    end
  end

  describe "edit" do
    before(:each) do
      @announcement = Factory(:announcement)
      Announcement.stubs(:find).returns(@announcement)
    end
    it "should render edit template" do
      get :edit, :id => "10"
      response.should render_template(:edit)
    end
  end

  describe "update" do
    before(:each) do
      @announcement = Factory(:announcement)
    end
    it "should render edit template when model is invalid" do
      Announcement.any_instance.stubs(:valid?).returns(false)
      put :update, :id => @announcement.id
      response.should render_template(:edit)
    end

    it "should redirect when model is valid" do
      Announcement.any_instance.stubs(:valid?).returns(true)
      put :update, :id => @announcement.id
      response.should redirect_to(announcement_url(assigns[:announcement]))
    end
  end

  describe "destroy" do
	
	before(:each) do
		@announcement = Factory(:announcement)
	end

     it "destroys the model" do
      delete :destroy, :id => @announcement.id
      response.should redirect_to(announcements_url)
      Announcement.exists?(@announcement.id).should be_false
    end
    it "redirects to index action" do
      delete :destroy, :id => @announcement.id
      response.should redirect_to(announcements_url)
    end
  end
  
end
