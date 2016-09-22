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

require 'rails_helper'

RSpec.describe Character, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
