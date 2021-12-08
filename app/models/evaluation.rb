class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :evaluator, :class_name => "User", :foreign_key => :evaluator_id
  belongs_to :evaluatee, :class_name => "User", :foreign_key => :evaluatee_id
  after_initialize :default_vals
  validates :evaluator_id, presence: true, numericality: {greater_than:0}
  validates :evaluatee_id, presence: true, numericality: {greater_than:0}
  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  #validate :assessment, allow_blank: false
  validates :group_id, presence: true, numericality: {greater_than:0}
  validates :project_id, presence: true, numericality: {greater_than:0}

  def default_vals
    self.submitted = false if self.submitted.nil?
    self.score = 0 if self.score.nil?
  end

  def in_time_window?

    if access_closes and access_opens then
      
      return Time.zone.now.between?(access_opens, access_closes)
    end
    return true
  end
end
