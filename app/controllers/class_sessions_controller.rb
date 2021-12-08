class ClassSessionsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]
  def index
    @class_sessions = ClassSession.paginate(page: params[:page])
  end
  
  def show
    @class_session = ClassSession.find(params[:id])
    @user = current_user
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


   def add_user_to_class
    xref = UserClassXRef.new()
    xref.class_session_id = params[:Class_session][:class_session_id]
    users = User.where(:first_name => params[:Class_session][:first_name], :last_name => params[:Class_session][:last_name])
    byebug
    user_id = users.first.id
    xref.user_id = user_id
    if xref.save
      flash[:success] = "Student added to class"
      redirect_to "/"
     else
      flash[:warning] = "Student not successfully added. There may not be a student with that name. Check the users page to be sure."
     end
   end

   def add_user_to_group
    xref = UserGroupXRef.new()
    groups = Group.where(:name => params[:Class_session][:name])
    group_id = groups.first.id
    xref.group_id = user_class_params[group_id]
    users = User.where(:first_name => user_class_params[:Class_session][:first_name], :last_name => user_class_params[:Class_session][:last_name])
    user_id = users.first.id
    xref.user_id = user_id
    if xref.save
      flash[:success] = "Student added to group"
      redirect_to "/"
     else
      flash[:warning] = "Student not successfully added. There may not be a student or group with that name."
     end
   end
   
   private
   def class_session_params
     params.require(:class_session).permit(:name)
   end

   def user_class_params
    params.permit(:first_name, :last_name, :class_session_id)
   end

  def user_group_params
    params.permit(:first_name, :last_name, :group_name)
  end
  
end


