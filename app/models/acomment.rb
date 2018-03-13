# == Schema Information
#
# Table name: acomments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  activity_id :integer
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Acomment < ApplicationRecord
  
  belongs_to :user
  belongs_to :activity

  validates :user_id, :presence => true
  validates :activity_id, :presence => true 
  validates :body, :presence => true 
  
end
