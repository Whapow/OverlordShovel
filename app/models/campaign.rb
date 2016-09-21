class Campaign < ActiveRecord::Base
	has_many :characters
	has_many :players, as: :additional_gms
	has_many :journals
	# has_one :shiny_pile

	validates_presence_of :name
end