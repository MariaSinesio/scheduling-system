class CreateProfileVaccines < ActiveRecord::Migration[8.0]
  def change
    create_table :profile_vaccines do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :vaccine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
