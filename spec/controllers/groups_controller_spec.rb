require 'spec_helper'

describe GroupsController do
  def mock_group(stubs={})
    @mock_group ||= mock_model(Group, stubs).as_null_object
  end
  
  describe "GET show" do
    it "should be success" do
      Group.stub(:find).with(1) { mock_group}
      get :show, :id => 1
      response.should be_success

    end
    it "assigns group as @group" do
      Group.stub(:find).with(1) { mock_group }
      get :show, :id => 1
      assigns(:group).should be(mock_group)
    end
  end
  
  describe "GET new" do
    it "should be success" do
      get :new
      response.should be_success
    end
    
    it "assigns new group as @group" do
      Group.stub(:new) { mock_group }
      get :new
      assigns(:group).should be(mock_group)
    end
  end
  
  describe "POST create" do
    describe "with valid attributes" do
      it "assigns new group to @group" do
        Group.stub(:new).with({'these'=>'params'}) { mock_group(:save => true) }
        post :create, :group => {'these' => 'params'}
        assigns(:group).should be(mock_group)
      end
      it "redirects to the created group" do
        Group.stub(:new) { mock_group(:save => true) }
        post :create, :group => {}
        response.should redirect_to(group_url(mock_group))
      end
    end
    describe "with invalid attributes" do
      it "assigns new but unsaved group as @group" do
        Group.stub(:new).with({'these'=>'params'}) { mock_group(:save => false) }
        post :create, :group => {'these' => 'params'}
        assigns(:group).should be(mock_group)
      end
      it "re-renders the 'new' template" do
        Group.stub(:new) { mock_group(:save => false) }
        post :create, :group => {}
        response.should render_template("new")
      end
    end
  end
end