# == Schema Information
#
# Table name: cuts
#
#  id               :integer          not null, primary key
#  session_id       :integer
#  player_id        :integer
#  experience_value :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Cut < ActiveRecord::Base
	belongs_to :player
	belongs_to :session
end
