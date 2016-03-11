class ChangeDefaultOnPublishedColumnFromEntries < ActiveRecord::Migration
  def change
      change_column :entries, :published, :boolean
  end
end
