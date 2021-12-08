class Group < ApplicationRecord
  has_many :user_group_x_refs
  has_many :users, through: :user_group_x_refs
  has_many :evaluations
  belongs_to :class_session

  validates :name, presence: {message: 'Group name needed'}
  
  def get_projects
    return Project.where(class_session_id: self.id)
  end

  def projects_complete?
    return number_complete_projects == number_projects
  end

  def number_complete_projects
    projs = get_projects
    completed_projs= 0;
    projs.each do |proj|
      if proj.complete? then
        completed_projs += 1
      end
    end
    return completed_projs
  end

  def number_projects
    return get_projects.count
  end

  def has_evaluations?
    return get_projects.any?{|project| project.get_evaluations.count > 0}
  end

  def students
    xrefs = UserGroupXRef.where(group_id: id)
    students = Array.new
    xrefs.each do |xref|
      xref_students= User.where(id: xref.user_id).to_a
      xref_students.each do |xref_student|
          if(xref_student.student?) then
            students.push(xref_student)
          end
      end
    end
    students
  end
end
