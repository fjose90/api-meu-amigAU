require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /' do
    it 'returns a JSON response with a welcome message' do
      # Fazendo a requisição GET para a rota raiz
      get root_path

      # Verifica se a resposta tem status HTTP 200 (OK)
      expect(response).to have_http_status(:ok)

      # Verifica se a resposta tem o tipo de conteúdo JSON
      expect(response.content_type).to eq('application/json; charset=utf-8')

      # Converte a resposta JSON para um hash
      json_response = response.parsed_body

      # Verifica se o JSON contém a chave 'message' com o valor esperado
      expect(json_response['message']).to eq('Bem-vindo à API! Aqui você pode acessar os endpoints disponíveis.')
    end
  end
end
