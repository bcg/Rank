class CreateBucketPermissions < ActiveRecord::Migration
  def self.up
    create_table :bucket_permissions do |t|
      t.integer :bucket_id
      t.integer :user_id
      t.boolean :admin
      t.boolean :moderator

      t.timestamps
    end
  end

  def self.down
    drop_table :bucket_permissions
  end
end
