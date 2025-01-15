class CreatePeople < ActiveRecord::Migration[8.0]
  def up
    # Criando o tipo enum no PostgreSQL
    execute <<-SQL
       DO $$
      BEGIN
        IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'person_type') THEN
          CREATE TYPE person_type AS ENUM ('physical', 'legal');
        END IF;
      END;
      $$;
    SQL

    # Criando a tabela `people` com as restrições necessárias
    create_table :people do |t|
      t.string :name, limit: 100, null: false
      t.string :cpf_cnpj, null: false
      t.date :birth_date, null: false
      t.string :phone
      t.string :email, null: false
      t.column :person_type, :person_type, null: false, default: 'physical'

      t.timestamps
    end
  end

  def down
    # Revertendo a criação da tabela e do tipo enum
    drop_table :people
    execute <<-SQL
      DROP TYPE IF EXISTS person_type;
    SQL
  end
end
