require 'spec_helper'

describe EventsController do

  before(:each) do
    @group = Factory(:group)
  end

  describe "GET index" do
    it "should be success" do
      get :index, :group_id => @group.id
      response.should be_success
    end
  end
  
end