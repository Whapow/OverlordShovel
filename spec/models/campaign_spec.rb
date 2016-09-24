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

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
