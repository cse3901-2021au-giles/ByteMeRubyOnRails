class ClassSession < ApplicationRecord
  has_many :groups
  has_many :user_class_x_refs
  has_many :users, through: :user_class_x_refs
  has_many :projects
end
