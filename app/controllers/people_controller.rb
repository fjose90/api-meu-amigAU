class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update destroy ]

  # GET /people
  def index
    @people = Person.all

    render json: @people.map { |person| PersonSerializer.new(person).as_json }
  end

  # GET /people/1
  def show
    render json: PersonSerializer.new(@person).as_json
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: PersonSerializer.new(@person).as_json, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: PersonSerializer.new(@person).as_json
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.expect(person: [ :name, :cpf_cnpj, :person_type, :birth_date, :phone, :email ])
    end
end
