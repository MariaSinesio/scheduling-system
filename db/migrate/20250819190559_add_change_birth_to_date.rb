class AddChangeBirthToDate < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :birth_date, :string
  end
end
