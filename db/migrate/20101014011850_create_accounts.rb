class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :cname

      t.timestamps
    end
    
    add_column :buckets, :account_id, :integer
    add_column :comments, :account_id, :integer
    add_column :posts, :account_id, :integer
    add_column :site_configurations, :account_id, :integer
    add_column :users, :account_id, :integer
    
    puts "don't forget to run the rake task"
  end

  def self.down
    remove_column :buckets, :account_id
    remove_column :comments, :account_id
    remove_column :posts, :account_id
    remove_column :site_configurations, :account_id
    remove_column :users, :account_id

    drop_table :accounts
  end
end
