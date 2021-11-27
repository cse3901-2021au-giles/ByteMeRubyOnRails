class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       colors = getTwoRandomColors
       @user.update_attribute(:color1, colors[0])
       @user.update_attribute(:color2, colors[1])
       log_in @user
       flash[:success] = "Welcome to the Sample App!"
       redirect_to @user
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
 
   private
    COLOR_OPTIONS = ["#ff7566", "#f7a197", "#faad5a", "#f0800a", "#e1e66c", "#94d415", "#d3ff7a", "#4f8c2e", "#57e674", "#74e8bc",
  "#05f599", "#5fe8d8", "#3e8c83", "#3e768c", "#3ebbed", "#00638a", "#001e8a", "#6b88f2", "#8f6bf2", "#4f2ab5", "#4a08ff",
  "#a408ff", "#c084e3", "#f57fe7", "#ab0598", "#ab0552", "#db3747"]
     def getTwoRandomColors
        colors = UsersController::COLOR_OPTIONS.sample(2)
        while colors[0] == colors[1] do 
          colors = UsersController::COLOR_OPTIONS.sample(2)
        end
        return colors
     end
     def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :password,
                                    :password_confirmation)
     end
     # Before filters
 
     # Confirms a logged-in user.
     def logged_in_user
       unless logged_in?
         store_location
         flash[:danger] = "Please log in."
         redirect_to login_url
       end
     end

     # Confirms the correct user.
     def correct_user
       @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user)
     end
end
