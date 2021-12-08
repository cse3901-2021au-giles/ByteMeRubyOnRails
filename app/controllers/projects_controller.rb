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
       redirect_to "/"
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
      redirect_to @project
     else
       render 'edit'
     end
   end
 
   def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
   end

   def generate_evaluations
    @project = Project.find(params[:Project][:eval_project].to_i)
    access_opens = params[:Project][:evaluation_window_opens]
    access_closes = params[:Project][:evaluation_window_closes]
    @project.students.each do |student_evaluator|
      @project.students.each do |student_evaluatee|
        evaluation = Evaluation.new(:evaluator_id=>student_evaluator.id, 
                                    :evaluatee_id=>student_evaluatee.id, 
                                    :group_id=>@project.group_id,
                                    :project_id=>@project.id,
                                    :access_opens=>access_opens,
                                    :access_opens=>access_closes)
        evaluation.save
        redirect_to @project
      end
    end
   end

   private
   def project_params
     params.require(:project).permit(:name)
   end
end

