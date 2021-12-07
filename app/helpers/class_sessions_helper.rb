module ClassSessionsHelper

    # def randomize_groups
    #     @class_session = ClassSession.find(params[:id])
    
    #     user_class_xrefs = UserClassXRef.where(class_session_id: @class_session.id)
    #     num_students = user_class_xrefs.count
    #     groups = Group.where(class_session_id: @class_session.id)
    #     num_groups = @class_session.number_groups
    
    #     if (num_groups == 0) then
    #       flash[:warn] = "Add some groups first!"
    #     elsif (num_students == 0) then
    #       flash[:warn] = "Add some groups first!"
    #     else
    #       max_students_per_group = (num_students / num_groups).ceil()
    
    #       user_class_xrefs.each do |xref|
    #         student = User.find(xref.user_id)
    
    #         loop do
    #           group = groups.sample
    #           user_group_xrefs = UserGroupXRef.where(group_id: group.id)       
    #         break if (user_group_xrefs.count < max_students_per_group)
    #         end
    
    #         new_user_group_xref = UserGroupXRef.new(group_id: group.id, user_id: xref.user_id)
    #         new_user_group_xref.save
    #       end
    #     end
    
    # end  

end
