class CalculatorInput < ApplicationRecord
  has_many :project_calculators, dependent: :restrict_with_error
end
