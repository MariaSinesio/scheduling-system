class ChangeCpfToStringInUsers < ActiveRecord::Migration[8.0]
  def change
     change_column :users, :cpf, :string
  end
end
