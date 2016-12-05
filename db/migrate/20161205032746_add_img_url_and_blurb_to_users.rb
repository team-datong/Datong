class AddImgUrlAndBlurbToUsers < ActiveRecord::Migration
  def change
    add_column :users, :img_url, :string, default: "http://www.freeiconspng.com/uploads/profile-picture-icon-png-people-person-profile--4.png"
    add_column :users, :blurb, :string, default: "No blurb available."
  end
end
