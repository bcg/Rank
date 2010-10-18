class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.integer :user_id
      t.string :name, :length => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
