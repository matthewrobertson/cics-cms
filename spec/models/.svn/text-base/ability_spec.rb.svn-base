require 'spec_helper'
require "cancan/matchers"
describe Ability do

    context "is_admin" do
      before(:each) do
        @user = Factory(:user)
        @ability = Ability.new(@user)
      end

    end


    context "not_admin" do
      before(:each) do
        @user = Factory(:user)
      end

      context "any user" do
        before(:each) do
          @friend = Factory(:user)
          @ability = Ability.new(@user)
        end

        it "can edit themselves" do
          @ability.should be_able_to(:edit, @user)
        end

        it "can not edit another user" do
          @ability.should_not be_able_to(:edit, @friend)
        end

        it "can not view other user's associated projects" do

        end


      end



      context "manager" do
        before(:each) do
          @manager = @user
          @random_user = Factory(:user)
          @contributor = Factory(:user)
          @project = Factory(:project, :owner_id => @manager.id)
          @project.users << @contributor
          @resource_m = Factory(:resource, :user_id => @manager.id)
          @resource_c = Factory(:resource, :user_id => @contributor.id, :project_id => @project.id)
          @ability = Ability.new(@manager)
        end

        it "can edit owned project" do
          @ability.should be_able_to(:edit, @project)
        end

        it "can view their associated projects" do

        end

        it "cannot manage a random resource" do
          @proj = Factory(:project, :owner_id => @random_user.id)
          @res = Factory(:resource, :project_id => @proj.id, :user_id => @random_user.id)
          @ability.should_not be_able_to(:manage, @res)
        end

        it "can delete other user's resource"  do
          @ability.should be_able_to(:destroy, @resource_c)
        end

        it "can replace other user's owned resource" do
          @ability.should be_able_to(:edit, @resource_c)
        end

        it "can modify other user's owned resource" do
          @ability.should be_able_to(:update, @resource_c)
        end

        it "can download resource" do

        end

        it "can upload resource" do

        end

        it "can delete owned resource" do
          @ability.should be_able_to(:destroy, @resource_m)

        end

        it "can replace owned resource" do
          @ability.should be_able_to(:edit, @resource_m)
        end

        it "can modify owned resource" do
          @ability.should be_able_to(:update, @resource_m)
        end

        it "can remove a member from project" do

        end


      end

      context "contributor" do

        before :each do
          @contributor = @user
          @manager = Factory(:user)
          @project = Factory(:project, :owner_id => @manager.id)
          @project.users << @contributor
          @resource_m = Factory(:resource, :user_id => @manager.id)
          @resource_c = Factory(:resource, :user_id => @contributor.id)
          @ability = Ability.new(@contributor)
        end

        it "starts out with contributor" do
          @project.users.find(@contributor.id).should_not be_nil
        end

        it "can not edit project" do
          @ability.should_not be_able_to(:edit, @project)
        end

        it "can not delete other user's resource"  do
          @ability.should_not be_able_to(:destroy, @resource_m)
        end

        it "can not replace other user's owned resource" do
           @ability.should_not be_able_to(:edit, @resource_m)
        end
        it "can not modify other user's owned resource" do
           @ability.should_not be_able_to(:update, @resource_m)
        end

        it "can download resource" do

        end

        it "can upload resource" do

        end

        it "can delete owned resource" do
            @ability.should be_able_to(:destroy, @resource_c)
        end

        it "can replace owned resource" do
            @ability.should be_able_to(:edit, @resource_c)
        end

        it "can modify owned resource" do
            @ability.should be_able_to(:update, @resource_c)
        end

      end
    end

end