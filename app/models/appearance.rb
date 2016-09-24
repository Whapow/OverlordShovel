# == Schema Information
#
# Table name: appearances
#
#  id           :integer          not null, primary key
#  journal_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  character_id :integer
#

class Appearance < ActiveRecord::Base
	belongs_to :character
	belongs_to :journal

	validates_presence_of :journal_id, :character_id

	def campaign
		self.journal.chapter.campaign
	end
end
