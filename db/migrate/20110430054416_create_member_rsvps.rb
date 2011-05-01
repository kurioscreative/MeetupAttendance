class CreateMemberRsvps < ActiveRecord::Migration
  def self.up
    create_table :member_rsvps do |t|
      t.integer :member_id
      t.string :response
      t.integer :meetup_id
      t.integer :meetup_member_id
      t.datetime :rsvp_updated
      t.integer :event_id
      t.timestamps
    end
    add_index :member_rsvps, :event_id
    add_index :member_rsvps, :member_id
  end

  def self.down
    remove_index :member_rsvps, :member_id
    remove_index :member_rsvps, :event_id
    drop_table :member_rsvps
  end
end