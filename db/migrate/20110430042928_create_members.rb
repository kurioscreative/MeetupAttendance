class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :link
      t.integer :meetup_id
      t.string :city
      t.string :state
      t.string :comment
      t.string :photo_url
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
