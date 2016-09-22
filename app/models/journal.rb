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

class Journal < ActiveRecord::Base
	belongs_to :campaign
	
end
