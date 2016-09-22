# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  description :text
#  value       :integer
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
	validates_presence_of :type

end
