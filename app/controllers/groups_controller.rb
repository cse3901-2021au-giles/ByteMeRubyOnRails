class GroupsController < ApplicationController
  
  # Show all the groups and its corresponding members
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
     @group = Group.new(group_params)
     if @group.save
       flash[:success] = "Successfully created your group!"
       redirect_to "/"
     else
       render 'new'
     end
   end

   def edit
     @group = Group.find(params[:id])
   end

   def update
     @group = Group.find(params[:id])
     if @group.update(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
     else
       render 'edit'
     end
   end
 
   def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to Groups_url
   end

   private
   def group_params
     params.require(:group).permit(:name, :group_type, :class_session_id)
   end
end
