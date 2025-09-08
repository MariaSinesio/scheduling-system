class CreateVaccines < ActiveRecord::Migration[8.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :technical_name
      t.decimal :price

      t.timestamps
    end
  end
end
