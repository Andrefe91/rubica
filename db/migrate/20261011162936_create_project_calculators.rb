class CreateProjectCalculators < ActiveRecord::Migration[8.1]
  def change
    create_table :project_calculators do |t|
      t.references :project,          null: false, foreign_key: true
      t.references :calculator,       null: false, foreign_key: true
      t.references :calculator_input, null: true,  foreign_key: true
      t.string :label, null: true

      t.string      :status,        null: false, default: "pending"
      t.jsonb       :result
      t.text        :error_message
      t.timestamptz :ran_at
      t.integer     :duration_ms

      t.timestamps
    end

    add_index :project_calculators, [:project_id, :calculator_id]
    add_index :project_calculators, :status
    add_check_constraint :project_calculators,
      "status IN ('pending', 'running', 'success', 'error')",
      name: "project_calculators_status_check"
  end
end
