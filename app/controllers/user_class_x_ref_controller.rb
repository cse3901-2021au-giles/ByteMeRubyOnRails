class UserClassXRefController < ApplicationController
    def new
        @user_class_xref = UserClassXRef.new()
        if @user_class_xref.save
            flash[:success] = "Successfully added student to class!"
            redirect_to "/"
          else
            render 'new'
          end
    end
end
