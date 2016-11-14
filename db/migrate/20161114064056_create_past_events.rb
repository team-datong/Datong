class CreatePastEvents < ActiveRecord::Migration
  def change
    create_table :past_events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :date_and_time, null: false

      t.timestamps null: false
    end
  end
end
