# == Schema Information
#
# Table name: plikes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  photo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plike < ApplicationRecord
  
  belongs_to :user
  belongs_to :photo
  
  validates :user_id, :presence => true, :uniqueness => { :scope => :photo_id }
  validates :photo_id, :presence => true
  
  
end
