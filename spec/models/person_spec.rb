require 'rails_helper'

RSpec.describe Person, type: :model do
  subject(:person) { build(:person) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(100) }

    it { should validate_presence_of(:cpf_cnpj) }
    it { should validate_uniqueness_of(:cpf_cnpj).case_insensitive }
    it { should allow_value('12345678901').for(:cpf_cnpj) }
    it { should allow_value('12345678901234').for(:cpf_cnpj) }
    it { should_not allow_value('123').for(:cpf_cnpj) }
    it { should_not allow_value('123456789012345').for(:cpf_cnpj) }

    it { should validate_presence_of(:birth_date) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
  end
end
