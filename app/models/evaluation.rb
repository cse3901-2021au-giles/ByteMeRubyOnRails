class Evaluation < ApplicationRecord
  belongs_to :project
  belongs_to :evaluator, :class_name => "User", :foreign_key => :evaluator_id
  belongs_to :evaluatee, :class_name => "User", :foreign_key => :evaluatee_id

  validates :evaluator_id, presence: true, numericality: {greater_than:0}
  validates :evaluatee_id, presence: true, numericality: {greater_than:0}
  validates :score, presence: true, numericality: {greater_than:-1}
  validates :assessment, presence: true
  validates :group_id, presence: true, numericality: {greater_than:0}
  validates :project_id, presence: true, numericality: {greater_than:0}
end
