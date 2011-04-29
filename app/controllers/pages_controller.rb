class PagesController < ApplicationController
  
  def home
    @groups = Group.all
  end
  
  
end