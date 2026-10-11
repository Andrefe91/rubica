class CreateCalculatorInputs < ActiveRecord::Migration[8.1]
  def change
    create_table :calculator_inputs do |t|
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
