class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t| # Sugestão do gpt
      t.references :profile, null: false, foreign_key: true
      t.references :vaccine, null: false, foreign_key: true
      t.string :booking_tk

      t.timestamps
    end
  end
end
