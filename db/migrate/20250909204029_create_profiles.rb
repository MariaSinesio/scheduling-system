class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :relations
      t.string :birth_date
      t.string :surname
      t.string :gender

      t.timestamps
    end
  end
end
