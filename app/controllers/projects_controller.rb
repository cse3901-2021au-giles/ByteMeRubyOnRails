class ProjectsController < ApplicationController
  
  # Show all the projects
  def index
    @projects = Project.all
  end
  
  # Show the evaluation status of one project
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
   
  end

  def create
     @project = Project.new(project_params)
     if @project.save
       flash[:success] = "Successfully created your project!"
       redirect_to "/class_sessions/" + @class_session.id
     else
       render 'new'
     end
   end

   def edit
     @project = Project.find(params[:id])
   end

   def update
     @project = Project.find(params[:id])
     if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to "/class_sessions/" + @class_session.id
     else
       render 'edit'
     end
   end
 
   def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
   end

   def generate_evaluations()
    
    byebug
   end

   def students
    Group.find(group_id).students
   end
   private
   def project_params
     params.require(:project).permit(:name)
   end
end

