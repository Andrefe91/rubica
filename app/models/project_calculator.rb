class ProjectCalculator < ApplicationRecord
  belongs_to :project
  belongs_to :calculator
  belongs_to :calculator_input, optional: true

  enum :status, {
    pending: "pending",
    running: "running",
    success: "success",
    error:   "error"
  }, prefix: true
end
