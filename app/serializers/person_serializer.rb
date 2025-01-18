# app/serializers/person_serializer.rb
class PersonSerializer
  def initialize(person)
    @person = person
  end

  def as_json
    {
      id: @person.id,
      name: @person.name,
      person_type: @person.person_type,
      cpf_cnpj: @person.cpf_cnpj,
      email: @person.email,
      phone: @person.phone,
      birth_date: @person.birth_date

    }
  end
end
