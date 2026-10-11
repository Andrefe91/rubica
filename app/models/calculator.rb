class Calculator < ApplicationRecord
  has_many :project_calculators, dependent: :restrict_with_error
  has_many :projects, through: :project_calculators
end
