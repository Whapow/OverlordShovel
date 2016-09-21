class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.string :name
      t.integer :campaign_id

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :journals  	
  end
end
