class DepartmentsProject < ApplicationRecord
  belongs_to :department
  belongs_to :project
end
