# == Schema Information
#
# Table name: characters
#
#  id              :integer          not null, primary key
#  name            :string
#  player_id       :integer
#  campaign_id     :integer
#  character_sheet :string
#  portrait_image  :string
#  token_image     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Character < ActiveRecord::Base
	belongs_to :player
	belongs_to :campaign

	validates_presence_of :name, :player_id
end
