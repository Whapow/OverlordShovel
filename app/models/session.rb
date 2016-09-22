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

class Session < ActiveRecord::Base
	has_many :characters
	belongs_to :journal
end
