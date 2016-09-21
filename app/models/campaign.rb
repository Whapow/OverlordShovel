class Campaign < ActiveRecord::Base
	has_many :characters
	belongs_to :player, as: :owner, foreign_key: :owner_id
	has_many :players, as: :additional_gms
	has_many :journals
	# has_one :shiny_pile

	validates_presence_of :name, :owner_id
	validates_uniqueness_of :name
end