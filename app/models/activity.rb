# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#  image       :string
#  keyword     :string
#  type        :string
#  duration    :string
#  distance    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Activity < ApplicationRecord
  
  belongs_to :user
  
  has_many :alikes
  has_many :acomments
  
  mount_uploader :image, ImageUploader
  
  validates :user_id, :presence => true
  
end
