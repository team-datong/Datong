class AddIsEventAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_event_admin, :boolean, :default => false
  end
end
