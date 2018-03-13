# == Schema Information
#
# Table name: alikes
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Alike < ApplicationRecord
  
  belongs_to :user
  belongs_to :activity
  
  validates :user_id, :presence => true, :uniqueness => { :scope => :activity_id }
  validates :activity_id, :presence => true
  
end
