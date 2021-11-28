class Project < ApplicationRecord
  belongs_to :class_session
  has_many :evaluations
end
