class RenameSystemToGameSystem < ActiveRecord::Migration
  def self.up
    rename_table :systems, :game_systems
    rename_column :campaigns, :system_id, :game_system_id
  end

  def self.down
    rename_table :game_systems, :systems
    rename_column :campaigns, :game_system_id, :system_id
  end
end