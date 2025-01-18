require 'capybara/rspec'
require 'simplecov'
require 'factory_bot'

SimpleCov.start do
  add_group 'Config', 'config'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Serializers', 'app/serializers'
  add_group 'Specs', 'spec'
end

# Este arquivo é copiado para spec/ quando você executa 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Impede a truncação do banco de dados se o ambiente for de produção
abort("O ambiente Rails está em modo de produção!") if Rails.env.production?

require 'rspec/rails'
require 'database_cleaner/active_record' # Adicionando a gem database_cleaner

# Verifica se há migrações pendentes e aplica-as antes dos testes
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Remova esta linha se você não estiver usando ActiveRecord ou fixtures do ActiveRecord
  config.fixture_paths = Rails.root.join('spec/fixtures')

# Adicionar suporte adicional ao RSpec, como o carregamento de arquivos em `spec/support`.
# Certifique-se de que a pasta `support` contém arquivos como `factory_bot.rb`.
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }

  # Se você não estiver usando ActiveRecord ou preferir não rodar cada exemplo dentro de uma transação, remova a linha abaixo ou atribua false em vez de true
  # config.use_transactional_fixtures = true

  # Filtra linhas de backtrace de gems do Rails
  config.filter_rails_from_backtrace!
  # gems arbitrárias também podem ser filtradas via:
  # config.filter_gems_from_backtrace("nome da gem")

  # Configuração do Shoulda Matchers
  Shoulda::Matchers.configure do |shoulda_config|
    shoulda_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  # Inclui o Capybara DSL
  config.include Capybara::DSL

  # Limpeza após os testes
  config.after(:each) do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # Usando o DatabaseCleaner para limpar o banco de dados entre os testes
  config.before(:suite) do
    # Limpar o banco de dados antes de rodar a suíte de testes
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    # Usar transações para testes normais (modelos)
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    # Limpar o banco de dados após cada teste
    DatabaseCleaner.clean
  end

  # Para testes de requisição (request specs), usamos truncamento
  config.before(:each, type: :request) do
    DatabaseCleaner.strategy = :truncation
  end
end

# Configuração do Capybara
Capybara.default_driver = :rack_test # Driver padrão para testes sem JS
Capybara.javascript_driver = :selenium_chrome_headless # Driver para testes com JS

Capybara.server = :puma, { Silent: true }
Capybara.server_host = '127.0.0.1'
Capybara.server_port = 3001
Capybara.app_host = 'http://127.0.0.1:3001'
