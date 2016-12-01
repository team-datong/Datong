class AddIsCoreMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_core_member, :boolean, :default => false
  end
end
