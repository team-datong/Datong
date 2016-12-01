class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    change_column :users, :fname, :string, null: false
    change_column :users, :lname, :string, null: false
  end

end
