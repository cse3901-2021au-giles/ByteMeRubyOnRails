class ClassSessionsController < ApplicationController

  def index
    @classes = ClassSession.all
  end
  
  def show
    @class_session = ClassSession.new
  end

  def new
    @class_session = ClassSession.new
    xref = UserClassXRef.new(:user_id => current_user.id, :class_session_id => @class_session.id)
    xref.save
  end

  def create
     @class_session = ClassSession.new(class_session_params)
     if @class_session.save
       flash[:success] = "Successfully created your class!"
       xref = UserClassXRef.new(:user_id => current_user.id, :class_session_id => @class_session.id)
       xref.save
       redirect_to "/"
     else
       render 'new'
     end
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
     else
       render 'edit'
     end
   end
 
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
   end

   private
   def class_session_params
     params.require(:class_session).permit(:name)
   end
  
end


