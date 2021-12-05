class ProjectsController < ApplicationController
  
  # Show all the projects
  def index
    @projects = Project.all
  end
  
  # Show the evaluation status of one project
  def show
    @project = Project.find(params[:id])
  end
  
end
