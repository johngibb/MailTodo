class CreateTodoLists < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.transaction do
      create_table :todo_lists do |t|
        t.string :title
        t.references :user

        t.timestamps
      end
      
      add_index :todo_lists, :user_id
      
      add_column :todos, :todo_list_id, :integer
      add_index :todos, :todo_list_id
          
      Todo.reset_column_information
          
      User.find_each do |user|
        l = TodoList.create! :title => 'Main', :user_id => user.id
        Todo.where(:user_id => user).update_all(:todo_list_id => l)
      end
      
      remove_column :todos, :user_id
    end
  end

  def self.down
    ActiveRecord::Base.transaction do
      add_column :todos, :user_id, :integer
      add_index :todos, :user_id
    
      Todo.reset_column_information
      
      TodoList.find_each do |l|
        Todo.where(:todo_list_id => l).update_all(:user_id => l.user)
      end
          
      remove_column :todos, :todo_list_id
      drop_table :todo_lists
    end
  end
end
