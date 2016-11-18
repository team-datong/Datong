class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, null: false
      t.string :attachment, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
