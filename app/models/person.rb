class Person < ApplicationRecord
  has_many :projects
  # has_many :projects, through: :projects_persons
end
