class Project < ApplicationRecord
  belongs_to :class_session, foreign_key: "class_session_id"
  belongs_to :group, foreign_key: "group_id"
  has_many :evaluations
  validates :group_id, presence: true
  def get_evaluations
    return Evaluation.where(project_id: self.id)
  end

  def complete?
    return number_complete_evaluations == number_evaluations
  end

  def number_complete_evaluations
    evals = get_evaluations
    completed_evals = 0;
    evals.each do |eval|
      if eval.submitted then
        completed_evals += 1
      end
    end
    return completed_evals
  end

  def number_evaluations 
    return get_evaluations.count
  end

  def students
    return Group.find(group_id).students
  end

  
  validates :name, presence: {message: 'Name needed'}
end

