    # Este arquivo deve garantir a existência dos registros necessários para rodar a aplicação em todos os ambientes (produção,
    # desenvolvimento, teste). O código aqui deve ser idempotente para que possa ser executado em qualquer ponto de qualquer ambiente.
    # Os dados podem então ser carregados com o comando bin/rails db:seed (ou criados junto com o banco de dados com db:setup).


    puts "Seeding data for the #{Rails.env} environment..."

    Person.destroy_all

    # Criando registros fictícios
    people = [
    { name: 'John Doe', cpf_cnpj: '12345678901', birth_date: '1990-01-15', phone: '123456789', email: 'johndoe@example.com', person_type: :physical },
    { name: 'Acme Corp', cpf_cnpj: '98765432100123', birth_date: '2000-05-20', phone: '987654321', email: 'contact@acmecorp.com', person_type: :legal },
    { name: 'Jane Smith', cpf_cnpj: '12345678902', birth_date: '1985-07-10', phone: '123123123', email: 'janesmith@example.com', person_type: :physical },
    { name: 'Global Inc', cpf_cnpj: '65432109876543', birth_date: '1995-03-12', phone: '456456456', email: 'info@globalinc.com', person_type: :legal }
    ]

    # Criando os registros no banco de dados
    people.each do |person|
    Person.create!(person)
    end

    puts "Seeded #{Person.count} people."
