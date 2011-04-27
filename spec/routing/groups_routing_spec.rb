require 'spec_helper'

describe GroupsController do
  describe "routing" do
   it "recognizes and generates #new" do
     { :get => "/groups/new" }.should route_to(:controller => "groups", :action => "new")
   end 
  end
end