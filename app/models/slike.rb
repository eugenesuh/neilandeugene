# == Schema Information
#
# Table name: slikes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  song_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slike < ApplicationRecord
  
   belongs_to :user
  belongs_to :song
  
  validates :user_id, :presence => true, :uniqueness => { :scope => :song_id }
  validates :song_id, :presence => true
  
end
