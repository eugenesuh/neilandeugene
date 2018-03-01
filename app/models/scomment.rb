# == Schema Information
#
# Table name: scomments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  song_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scomment < ApplicationRecord
  
  belongs_to :user
  belongs_to :song

  validates :user_id, :presence => true
  validates :song_id, :presence => true 
  validates :body, :presence => true 

end
