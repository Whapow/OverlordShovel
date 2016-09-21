class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.integer :player_id
      t.integer :campaign_id
      t.string :character_sheet
      t.string :portrait_image
      t.string :token_image

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :characters
  end
end
