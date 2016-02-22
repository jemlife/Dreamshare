class Entry < ActiveRecord::Base
<<<<<<< HEAD
=======
  has_many :categories, dependent: :destroy
>>>>>>> entry-categories
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validate :image_size
  #validates :user_id, presence: true
  #belongs_to :user  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader


  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should not exceed 5MB")
    end
  end

end
