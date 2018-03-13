# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  age        :string
#  food       :string
#  lastname   :string
#  firstname  :string
#  dietary    :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ApplicationRecord
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :user_id, :presence => true
  
end
