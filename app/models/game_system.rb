class GameSystem < ActiveRecord::Base
	has_many :campaigns
	validates_presence_of :name
end
