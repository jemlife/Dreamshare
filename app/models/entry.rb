class Entry < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true
  #validates :user_id, presence: true
  #belongs_to :user  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
end
