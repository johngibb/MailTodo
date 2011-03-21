class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email

      t.timestamps
      
      t.index :email, :unique => true
    end
  end

  def self.down
    drop_table :users
  end
end
