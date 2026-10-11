class Project < ApplicationRecord
  has_many :project_members, dependent: :destroy # Not sure about this one
  has_many :users, through: :project_members
  has_many :project_calculators, dependent: :destroy
  has_many :calculator_inputs, through: :project_calculators
end
