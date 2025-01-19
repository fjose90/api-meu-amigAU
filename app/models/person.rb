class Person < ApplicationRecord
  # Definição do enum para o tipo de pessoa
  enum :person_type, physical: 1, legal: 2

  # Validações
  validates :name,
            presence: true,
            length: { minimum: 5, maximum: 100 }

  validates :cpf_cnpj,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A\d{11,14}\z/,
              message: 'must be 11 or 14 digits'
            }

  validates :birth_date,
            presence: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP,
                      message: 'must be a valid email address' }

  validates :person_type,
            presence: true

  validates :phone,
            presence: true,
            format: { with: /\A\(\d{2}\) \d{4,5}-\d{4}\z/,
                      message: 'deve estar no formato (XX) XXXX-XXXX ou (XX) XXXXX-XXXX' }
end
