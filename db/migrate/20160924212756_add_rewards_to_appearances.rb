class AddRewardsToAppearances < ActiveRecord::Migration
  def self.up
  	change_table :appearances do |a|
  		a.integer :reward_value
  		a.integer :experience_value
  	end
  end

  def self.down
  	change_table :appearances do |a|
  		a.remove :reward_value
  		a.remove :experience_value
  	end
  end
end
