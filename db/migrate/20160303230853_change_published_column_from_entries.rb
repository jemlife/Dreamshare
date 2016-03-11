class ChangePublishedColumnFromEntries < ActiveRecord::Migration
  def change
    change_column :entries, :published, :boolean, default: 0
  end
end
