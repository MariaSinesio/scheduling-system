class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.integer :day
      t.datetime :hourly

      t.timestamps
    end
  end
end
