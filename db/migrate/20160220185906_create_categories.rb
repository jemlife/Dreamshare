class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :categories, [:entry_id, :created_at]
  end
end
