source 'https://rubygems.org'

# Em vez disso, empacote Edge Rails: gem "Rails", github: "Rails/Rails", branch: "main"
gem 'rails', '~> 8.0.1'
# Use postgresql como banco de dados para Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Crie APIs JSON com facilidade [https://github.com/rails/jbuilder]
# gema "jbuilder"

# Use o modelo ativo has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gema "bcrypt", "~> 3.1.7"

# O Windows não inclui arquivos zoneinfo, então agrupe a gema tzinfo-data
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use os adaptadores baseados em banco de dados para Rails.cache, Active Job e Action Cable
gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

# Reduz o tempo de inicialização através do cache; necessário em config/boot.rb
gem 'bootsnap', require: false

# Implante este aplicativo em qualquer lugar como um contêiner Docker [https://kamal-deploy.org]
gem 'kamal', require: false

# Adicione cache/compactação de ativos HTTP e aceleração X-Sendfile ao Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# Use variantes do Active Storage [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gema "processamento de imagem", "~> 1.2"

# Use Rack CORS para lidar com o compartilhamento de recursos de origem cruzada (CORS), tornando possível o Ajax
# gem "rack-cors"

# Para variáveis de ambiente
gem 'dotenv-rails', '~> 3.1'

group :development, :test do
  # Consulte https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # Análise estática de vulnerabilidades de segurança [https://brakemanscanner.org/]
  gem 'brakeman', require: false

  # Testes
  gem 'rspec-rails', '~> 7.1'

  gem 'shoulda-matchers', '~> 6.0'

  # Testes de funcionalidades e recursos
  gem 'capybara', '~> 3.38' # Principal biblioteca para testes de recursos

  # Geração de dados falsos
  gem 'faker', '~> 3.5'

  # Cobertura de código
  gem 'simplecov', '~> 0.22.0', require: false

  # Para testes de requisições
  gem 'database_cleaner-active_record'

  gem 'spring-commands-rspec'

  gem 'factory_bot_rails', '~> 6.4'
end
