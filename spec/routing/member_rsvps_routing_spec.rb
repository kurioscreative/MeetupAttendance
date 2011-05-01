require 'spec_helper'

describe MemberRsvpsController do
  describe "routing" do
    it "recognizes and generates #create" do
      { :post => "/members/1/rsvps"}.should route_to(:controller => "member_rsvps", :action => "create", :member_id => "1")
    end
  end
end