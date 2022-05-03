class Budget < ApplicationRecord
  has_one :project
  belongs_to :organization
end
