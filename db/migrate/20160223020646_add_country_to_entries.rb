class AddCountryToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :country, :string
  end
end
