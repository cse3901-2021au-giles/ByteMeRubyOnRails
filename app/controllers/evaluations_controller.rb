class EvaluationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]
  # Shows all evaluations
  # 
  #
  def index   
    @evaluations = Evaluation.all
    @user = User.find(current_user.id)
  end

  # Shows one evaluation for a student
  #
  #
  def show
    @evaluation = Evaluation.find(params[:id])
  end

  # Gets a form for editing a evaluation for a student
  # 
  #
  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      @evaluation.submitted = true
      @evaluation.save
     flash[:success] = "Evaluation submitted"
     redirect_to evaluations_path
    else
      render 'edit'
    end
  end
  # Gets a form for a new evaluation for a student
  # 
  #
  def new
    @evaluation = Evaluation.new
  end

  # Deletes an evaluation
  # 
  #
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  def evaluation_params
    params.require(:evaluation).permit(:evaluator_id, :evaluatee_id, :submitted)
  end


  def evaluation_params
    params.require(:evaluation).permit(:evaluation_id, :evaluatee_id, :score, :assessment,
                                 :project, :group, :submitted)
  end
end
