class AddIsAccountAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_account_admin, :boolean, :default => false
  end
end
