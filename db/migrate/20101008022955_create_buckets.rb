class CreateBuckets < ActiveRecord::Migration
  def self.up
    create_table :buckets do |t|
      t.string :name
      t.text :description
      t.integer :owner
      t.timestamps
    end
  end

  def self.down
    drop_table :buckets
  end
end
