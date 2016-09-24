class RenameAndReconfigureTables < ActiveRecord::Migration
  def self.up
    
    change_table :sessions do |s|
	    s.integer :character_id
	    s.remove :description
	  end

	  rename_table :sessions, :appearances

    create_table :chapters do |c|
      c.string :name
      c.integer :campaign_id

      c.timestamps null: false
    end

    rename_column :journals, :campaign_id, :chapter_id

  end

  def self.down

    rename_column :journals, :chapter_id, :campaign_id

    drop_table :chapters

    rename_table :appearances, :sessions
    
    change_table :sessions do |s|
	    s.remove :character_id
	    s.text :description
	  end

  end
end
