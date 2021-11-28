class Evaluation < ApplicationRecord
  belongs to :project
  belongs_to :user
end
