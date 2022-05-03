class Office < ApplicationRecord
  belongs_to :organization
  # has_many :project_offices
  # has_many :projects, through: :project_offices
  has_and_belongs_to_many :projects
end
