# == Schema Information
#
# Table name: journals
#
#  id          :integer          not null, primary key
#  name        :string
#  campaign_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Journal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
