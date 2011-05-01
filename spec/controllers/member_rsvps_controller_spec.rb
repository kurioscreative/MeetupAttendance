require 'spec_helper'

describe MemberRsvpsController do
  def mock_rsvp(stubs={})
    @mock_rsvp = mock_model(MemberRsvp, stubs).as_null_object
  end


  describe "POST create" do
    it "should assign " do
      MemberRsvp.stub(:new).with({'these'=>'params'}) { mock_rsvp(:save => true) }
      post :create, :member_rsvp => {'these'=>'params'}
      assigns(:rsvp).should be(mock_rsvp)
    end
  end
end