class Api::PetsController < ApplicationController
  def index
    render status: 200, json: {
      pets: Pet.all
    }.to_json
  end

  def show
      render status: 200, json: {
        pet: Pet.find(params[:id])
      }.to_json
  end

end
