# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  name       :string
#  chapter_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Journal < ActiveRecord::Base
	belongs_to :chapter
	has_many :appearances
	has_many :characters, through: :appearances

	validates_presence_of :chapter_id, :name
	
	def newest?
		self == self.chapter.journals.last
	end

	def campaign
		self.chapter.campaign
	end

end
