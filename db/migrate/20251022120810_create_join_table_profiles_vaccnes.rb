class CreateJoinTableProfilesVaccnes < ActiveRecord::Migration[8.0]
  def change
    create_join_table :profiles, :vaccines do |t|
      t.index [ :profile_id, :vaccine_id ]
      t.index [ :vaccine_id, :profile_id ]
    end # Cria uma tabela de junçaõ entre profile e vaccines
  end
end
