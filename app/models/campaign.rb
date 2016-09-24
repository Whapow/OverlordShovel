# == Schema Information
#
# Table name: campaigns
#
#  id             :integer          not null, primary key
#  name           :string
#  game_system_id :integer
#  owner_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Campaign < ActiveRecord::Base
	belongs_to :owner, class_name: "Player", foreign_key: :owner_id
	belongs_to :game_system
	has_many :players, as: :additional_gms
	has_many :characters
	has_many :chapters
	# has_one :shiny_pile

	validates_presence_of :name, :owner_id, :game_system_id
	validates_uniqueness_of :name

end
