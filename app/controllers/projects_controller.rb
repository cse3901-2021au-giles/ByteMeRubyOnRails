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
  

    access_opens = Time.zone.parse(params[:Project]['evaluation_window_starts(1i)'] + '-' + params[:Project]['evaluation_window_starts(2i)'] + '-' + params[:Project]['evaluation_window_starts(3i)'] + '-' + params[:Project]['evaluation_window_starts(4i)'] + '-' + params[:Project]['evaluation_window_starts(5i)'] )
    access_closes = Time.zone.parse(params[:Project]['evaluation_window_ends_(1i)'] + '-' + params[:Project]['evaluation_window_ends_(2i)'] + '-' + params[:Project]['evaluation_window_ends_(3i)'] + '-' + params[:Project]['evaluation_window_ends_(4i)'] + '-' + params[:Project]['evaluation_window_ends_(5i)'] )
    
    
    if access_opens < access_closes then
      @project.students.each do |student_evaluator|
        @project.students.each do |student_evaluatee|
          evaluation = Evaluation.new(:evaluator_id=>student_evaluator.id, 
                                      :evaluatee_id=>student_evaluatee.id, 
                                      :group_id=>@project.group_id,
                                      :project_id=>@project.id,
                                      :access_opens=>access_opens,
                                      :access_closes=>access_closes)
          evaluation.save
          byebug
          redirect_to @project
        end
      end
    else
      flash[:danger] = "Evaluation close must be after evaluation open"

      redirect_to new_evaluation_path(:project => @project.id)
    end
   end

   private
   def project_params
     params.require(:project).permit(:name)
   end
end

