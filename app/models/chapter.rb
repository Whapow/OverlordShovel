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

class Chapter < ActiveRecord::Base
	belongs_to :campaign
	has_many :journals

	validates_presence_of :campaign_id

  def newest?
    self == self.campaign.chapters.last
  end

end
