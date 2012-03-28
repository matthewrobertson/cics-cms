require 'spec_helper'

describe ProjectsController do
  render_views
  
  before(:each) do
      controller.stubs(:is_logged_in)
  end
  
  describe "index" do
    it "renders index template" do
      get :index
      response.should render_template(:index)
    end


 end

  describe "show" do

    before(:each) do
      @project = Factory(:project)
      @stub = []
      @stub.stubs(:all).returns([])
      Project.stubs(:find).returns(@project)
    end

    it "should render show template" do
      get :show, :id => "22"
      response.should render_template(:show)
    end
	
    it "finds and assigns the project" do
      get :show, :id => "22" 
      assigns(:project).should eq(@project)
    end

    it 'assigns contributors to project' do
      @project.expects(:users).returns(@stub)
      get :show, :id => "22" 
      assigns(:managed_users).should eq []
    end
    
    it 'assigns resources to project' do
      @project.expects(:resources).returns(@stub)
      get :show, :id => "22" 
      assigns(:managed_resources).should eq []
    end

  end

  describe "new" do
    it "creates a new project and assigns is" do
      get :new
      assigns(:project).should_not be_nil
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end
  end

  describe "create" do
    it "should render new template when model is invalid" do
      Project.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "should redirect when model is valid" do
      Project.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(project_url(assigns[:project]))
    end
  end

  describe "edit" do

  before(:each) do
      @project = Factory.build(:project)
      Project.stubs(:find).returns(@project)
    end

    it "should render edit template" do
      get :edit, :id => "22"
      response.should render_template(:edit)
    end
  end

  describe "update" do

    before(:each) do
      @project = Factory(:project)
    end

    it "update action should render edit template when model is invalid" do
      Project.any_instance.stubs(:valid?).returns(false)
      put :update, :id => @project.id
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      Project.any_instance.stubs(:valid?).returns(true)
      put :update, :id => @project.id
      response.should redirect_to(project_url(assigns[:project]))
    end
  end

  describe "destroy" do

    before(:each) do
      @project = Factory(:project)
    end

    it "destroys the model" do
      delete :destroy, :id => @project.id
      response.should redirect_to(projects_url)
      Project.exists?(@project.id).should be_false
    end

    it 'redirects to the index action' do
      delete :destroy, :id => @project.id
      response.should redirect_to(projects_url)
    end

  end

end
