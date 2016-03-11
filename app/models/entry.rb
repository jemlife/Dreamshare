class Entry < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  validate :image_size
  scope :only_private, -> { where(published: false) }
  scope :only_public, -> { where(published: true)}

  #validates :user_id, presence: true
  #belongs_to :user  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  def country_name
   country = self.country
   ISO3166::Country[country]
  end


  def self.search(search)
    if search
      where("dream_category LIKE ? OR content LIKE ?
      OR country LIKE ? OR created_at LIKE ?", "%#{search}%", "%#{search}%",
      "%#{search}%", "%#{search}%")
      #where("content LIKE ?", "%#{search}%")
      #where("country LIKE ?", "%#{search}%")
      #where("created_at LIKE ?", "%#{search}%")
    else
      all
    end
  end


  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "should not exceed 5MB")
    end
  end

end
