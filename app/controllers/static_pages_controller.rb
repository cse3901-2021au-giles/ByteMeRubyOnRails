class StaticPagesController < ApplicationController
  def home 
    if logged_in?
      redirect_to user_path(current_user)
    end
  end
  
  def about
  end
  
  def contact
  end
  
  def instruction
  end
  
end
