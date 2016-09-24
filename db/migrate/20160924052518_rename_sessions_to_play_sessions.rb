class RenameSessionsToPlaySessions < ActiveRecord::Migration
  def self.up
    rename_table :sessions, :play_sessions
  end

  def self.down
    rename_table :play_sessions, :sessions
  end
end
