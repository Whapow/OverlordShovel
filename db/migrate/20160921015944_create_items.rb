class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :owner_id
      t.text :description
      t.integer :value

      t.string :type

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :items
  end
end
