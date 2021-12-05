class Project < ApplicationRecord
  belongs_to :class_session, foreign_key: "class_session_id"
  has_many :evaluations
  
  validates :name, presence: {message: 'Name needed'}
end
