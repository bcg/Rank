class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first, :length => 40
      t.string :last, :length => 40
      t.string :username, :length => 40
      t.string :email, :length => 80
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.timestamps
    end
    
    add_index :users, :username
    add_index :users, :email
    add_index :users, :persistence_token
  end

  def self.down
    drop_table :users
  end
end
