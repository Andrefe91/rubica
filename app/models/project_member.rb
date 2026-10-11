class ProjectMember < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :role, { owner: "owner", edit: "edit", read: "read" }, prefix: true
end
