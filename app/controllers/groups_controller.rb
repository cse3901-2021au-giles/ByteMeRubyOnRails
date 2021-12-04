class GroupsController < ApplicationController
  
  # Show all the groups and its corresponding members
  def index
    @groups = Group.all
  end
end
