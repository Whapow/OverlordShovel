# == Schema Information
#
# Table name: game_systems
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameSystem < ActiveRecord::Base
	has_many :campaigns
	validates_presence_of :name
end
