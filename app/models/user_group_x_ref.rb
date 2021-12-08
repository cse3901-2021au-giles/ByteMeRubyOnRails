class UserGroupXRef < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :group_id, presence: true, numericality: {greater_than:0}
  validates :user_id, presence: true, numericality: {greater_than:0}
end
