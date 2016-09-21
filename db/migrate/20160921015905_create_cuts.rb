class CreateCuts < ActiveRecord::Migration
  def self.up
    create_table :cuts do |t|
      t.integer :session_id
      t.integer :player_id
      t.integer :experience_value

      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :cuts
  end
end
