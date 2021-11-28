class Group < ApplicationRecord
  has_many :user_group_x_refs
  has_many :users, through: :user_group_x_refs
  has_many :evaluations
  belongs_to :class_session
end
