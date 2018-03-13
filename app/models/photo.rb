# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :text
#  user_id    :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  
  belongs_to :user
  
  has_many :plikes
  has_many :pcomments
  
  mount_uploader :image, ImageUploader
  
  validates :user_id, :presence => true
  
end
