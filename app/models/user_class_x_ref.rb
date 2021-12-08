class UserClassXRef < ApplicationRecord
  belongs_to :user
  belongs_to :class_session

  validates :class_session_id, presence: true, numericality: {greater_than:0}
  validates :user_id, presence: true, numericality: {greater_than:0}
end
