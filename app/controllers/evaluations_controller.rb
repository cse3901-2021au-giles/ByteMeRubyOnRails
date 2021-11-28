class EvaluationsController < ApplicationController

  # Shows all evaluations
  # 
  #
  def index   
    @evaluations = Evaluation.all 
  end

  # Shows one evaluation for a student
  #
  #
  def show
  end

  # Gets a form for editing a evaluation for a student
  # 
  #
  def edit
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
  
end
