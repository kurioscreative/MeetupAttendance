class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.column :name, :string
      t.column :meetup_id, :integer
      t.column :group_id, :integer
      t.column :status, :string
      t.column :event_url, :string
      t.column :description, :text
      t.column :time, :datetime
      t.timestamps
    end
    add_index :events, :meetup_id, :unique => true
    add_index :events, :group_id
  end

  def self.down
    remove_index :events, :group_id
    remove_index :events, :column => :meetup_id
    drop_table :events
  end
end