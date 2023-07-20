class Shoutout < ApplicationRecord
  has_one_attached :profile_image
  has_one_attached :shoutout_image
  
  validates :name, presence: true
  validates :description, presence: true
  validates :message, presence: true


  def as_json(options = {})
    super(options).merge({
      profile_image_url: nil,
      shoutout_image_url: nil
    })
  end
end
