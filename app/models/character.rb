class Character < ActiveRecord::Base
	belongs_to :player
	belongs_to :campaign

	validates_presence_of :name, :player_id
end
