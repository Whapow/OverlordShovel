class Session < ActiveRecord::Base
	has_many :characters
	belongs_to :journal
end
