class AddCellphoneFieldToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :cellphone, :string
  end
end
