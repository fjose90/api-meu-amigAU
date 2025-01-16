class HomeController < ApplicationController
    def index
        render json: { message: "Bem-vindo à API! Aqui você pode acessar os endpoints disponíveis." }
    end
end
