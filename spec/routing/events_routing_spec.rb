require 'spec_helper'

describe EventsController do
  describe "routing" do
    before(:each) do
      @group = Factory(:group)
    end
    
    it "recognizes and generates #index" do
       { :get => "/groups/1/events" }.should route_to(:controller => "events", :action => "index", :group_id => "1")
     end 
  end
end