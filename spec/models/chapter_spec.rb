# == Schema Information
#
# Table name: chapters
#
#  id          :integer          not null, primary key
#  name        :string
#  campaign_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Chapter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
