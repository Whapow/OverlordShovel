# == Schema Information
#
# Table name: sessions
#
#  id          :integer          not null, primary key
#  journal_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Session, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
