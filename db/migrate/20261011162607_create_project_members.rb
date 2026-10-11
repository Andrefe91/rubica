class CreateProjectMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :project_members do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user,    null: false, foreign_key: true
      t.string     :role,    null: false, default: "owner" # Always at least one owner per project

      t.timestamps
    end

    # The same user can belong more than one time per project
    add_index :project_members, [:project_id, :user_id], unique: true

    # Check that the role belongs to one of this three
    add_check_constraint :project_members,
      "role IN ('owner', 'edit', 'read')", name: "project_members_role_check"
  end
end
