# == Schema Information
#
# Table name: pcomments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  photo_id   :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pcomment < ApplicationRecord
  
  belongs_to :user
  belongs_to :photo

  validates :user_id, :presence => true
  validates :photo_id, :presence => true 
  validates :body, :presence => true 
  
end
