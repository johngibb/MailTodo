class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.references :user
      t.string :title
      t.string :description

      t.timestamps
      
      t.index :user_id
    end
  end

  def self.down
    drop_table :todos
  end
end
