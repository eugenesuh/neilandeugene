# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string
#  artist     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Song < ApplicationRecord
  
  belongs_to :user
  
  has_many :slikes
  has_many :scomments
  
  mount_uploader :image, ImageUploader

  validates :user_id, :presence => true
end
