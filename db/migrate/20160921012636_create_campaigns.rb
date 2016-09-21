class CreateCampaigns < ActiveRecord::Migration
  
  def self.up
    create_table :campaigns do |c|
      c.string :name
      c.integer :system_id
      c.integer :owner_id

      c.timestamps null: false
    end
  end

  def self.down
  	drop_table :campaigns
  end

end
