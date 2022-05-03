class Organization < ApplicationRecord
  has_one :project
  has_many :office
  has_many :budget
  has_many :department
end
