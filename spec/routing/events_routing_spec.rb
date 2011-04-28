require 'spec_helper'

describe EventsController do
  describe "routing" do
    it "recognizes and generates #index" do
       { :get => "/events" }.should route_to(:controller => "events", :action => "index")
     end 
  end
end