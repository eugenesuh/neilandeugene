# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ApplicationRecord
  
  belongs_to :user
  has_many :guests, :foreign_key => "user_id"


  validates :user_id, :presence => true

end
