class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.references :user
      t.string :title
      t.string :description

      t.timestamps
    end
    
    add_index :todos, :user_id
  end

  def self.down
    drop_table :todos
  end
end
