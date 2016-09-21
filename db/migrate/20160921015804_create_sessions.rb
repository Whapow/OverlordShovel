class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :journal_id
      t.text :description

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :sessions
  end
end
