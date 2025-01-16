class CreatePeople < ActiveRecord::Migration[8.0]
  def up
    # Criando a tabela `people` com as restrições necessárias
    create_table :people do |t|
      t.string :name, limit: 100, null: false
      t.string :cpf_cnpj, null: false
      t.date :birth_date, null: false
      t.string :phone
      t.string :email, null: false
      t.interger :person_type, null: false, default: 1 # 1 para 'physical', 2 para 'legal'

      t.timestamps
    end
  end

  def down
    # Revertendo a criação da tabela e do tipo enum
    drop_table :people
  end
end
