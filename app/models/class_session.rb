class ClassSession < ApplicationRecord
  has_many :groups
  has_many :user_class_x_refs, :inverse_of => :class_session
  has_many :users, :through => :user_class_x_refs
  has_many :projects

  def get_groups
    return Group.where(class_session_id: self.id)
  end

  def groups_complete?
    return number_complete_groups == number_groups
  end

  def number_complete_groups
    groups = get_groups
    completed_groups= 0;
    groups.each do |group|
      if group.projects_complete? then
        completed_groups += 1
      end
    end
    return completed_groups
  end

  def number_groups
    return get_groups.count
  end

  def has_evaluations?
    byebug
    return get_groups.any? {|group| group.has_evaluations?}
  end
end
