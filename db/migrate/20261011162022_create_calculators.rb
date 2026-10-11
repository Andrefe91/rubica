class CreateCalculators < ActiveRecord::Migration[8.1]
  def change
    create_table :calculators do |t|
      t.string  :name,       null: false
      t.string  :slug,       null: false
      t.text    :description
      t.boolean :visibility, null: false, default: false
      t.jsonb   :api_call,   null: false, default: {}

      t.timestamps
    end

    add_index :calculators, :slug, unique: true
  end
end
