class Project < ApplicationRecord
  belongs_to :organization
  
  # belongs_to :supervisor, class: 'Person'
  # belongs_to :supervisor, class_name: 'Person'
  belongs_to :person
  # has_many :projects_persons
  # has_many :persons, through: :projects_persons
  belongs_to :budget
  
  # has_many :project_offices
  # has_many :office, through: :project_offices
  has_and_belongs_to_many :offices
  has_and_belongs_to_many :departments
  # has_many :project_departments
  # has_many :department, through: :project_departments
end
