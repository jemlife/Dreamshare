class AddDreamCategoryToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :dream_category, :string
    
  end
end
