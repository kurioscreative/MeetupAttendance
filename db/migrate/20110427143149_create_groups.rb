class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.column :meetup_id, :integer
      t.column :link, :string
      t.column :organizer_id, :integer
      t.column :organizer_profile_url, :string
      t.column :organizer_name, :string
      t.column :description, :text
      t.column :name, :string
      t.column :photo_url, :string
      t.column :group_urlname, :string
      
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
