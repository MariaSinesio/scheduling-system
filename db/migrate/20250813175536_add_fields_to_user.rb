class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :integer
    add_column :users, :surname, :string
    add_column :users, :gender, :string
    add_column :users, :cpf, :integer
  end
end
