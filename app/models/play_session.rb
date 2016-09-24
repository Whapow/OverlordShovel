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

class PlaySession < ActiveRecord::Base
	has_many :characters
	belongs_to :journal

	validates_presence_of :journal_id, :description

	def campaign
		self.journal.campaign
	end
end
