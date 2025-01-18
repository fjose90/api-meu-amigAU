class Person < ApplicationRecord
    enum :person_type,  physical: 1, legal: 2


    validates :name,
    presence: true,
    length: { minimum: 5, maximum: 100 }

    validates :cpf_cnpj, presence: true, format: {
    with: /\A\d{11,14}\z/,
    message: "must be 11 or 14 digits"
  }

    validates :birth_date,
    presence: true


    validates :email,
     presence: true,
     format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

    validates :person_type, presence: true
end
