class Department < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :projects
  # has_many :project_departments
  # has_many :projects, through: :project_departments
end
