class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :evaluator, :class_name => "User", :foreign_key => :evaluator_id
  belongs_to :evaluatee, :class_name => "User", :foreign_key => :evaluatee_id

  validates :evaluator_id, presence: true, numericality: {greater_than:0}
  validates :evaluatee_id, presence: true, numericality: {greater_than:0}
  validates :score, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :assessment, presence: true, allow_blank: false
  validates :group_id, presence: true, numericality: {greater_than:0}
  validates :project_id, presence: true, numericality: {greater_than:0}
  validates :submitted, presence: true
end
