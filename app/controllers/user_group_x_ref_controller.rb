class UserGroupXRefController < ApplicationController
    def new
        @user_group_xref = UserGroupXRef.new
        if @user_group_xref.save
            flash[:success] = "Successfully added student to group!"
            redirect_to "/"
          else
            render 'new'
          end
      end
end
