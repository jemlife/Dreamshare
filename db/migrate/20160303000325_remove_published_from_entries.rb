class RemovePublishedFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :published
  end
end
