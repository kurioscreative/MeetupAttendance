class PagesController < ApplicationController
  
  def home
    @events = RMeetup::Client.fetch(:events,    
        { :group_urlname => "ruby-nuby-info", 
          :after => "-1d"
        })
  end
  
  
end