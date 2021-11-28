class ClassSessionsController < ApplicationController

  def index
    @classes = ClassSession.all
  end
  
  def show
  end
  
end
