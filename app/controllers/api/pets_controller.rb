class Api::PetsController < ApplicationController
    before_action :load_pet, except: [:index, :create]

    def index
        @pets = Pet.all
        render status: 200, json: { pets: @pets }.to_json
    end

    # def owners_pets
    #     @owner = Owner.where(user_id: session[:current_user_id])
    #     @pets = Pet.where(owner: @owner)
    #
    #     render status: 200, json: {
    #         pets: @pets,
    #         session: session,
    #         session_id: session.id,
    #         session_id_from_request: @session_id,
    #         current_user_id: @current_user_id
    #     }.to_json
    # end

    def show
        render_pet
    end

    def create
      @pet = Pet.new(pet_params)

      if @pet.save
        render_pet status: :created
      else
        render_errors
      end
    end

    def update
      if @pet.update(pet_params)
        render_pet status: 226
      else
        render_errors
      end
    end

    def destroy
      if @pet.destroy
        head :ok
      else
        render_errors "Could not destroy this pet, sorry"
      end
    end


    private

        def pet_params
          params.require(:pet).permit(:name, :species, :owner)
        end

        def render_pet(status:  200)
          render json: @pet, status: status
        end

        def render_errors(errors = nil)
          errors ||= @pet.errors
          render json: { errors: errors }, status: :unprocessible_entity
        end

        def load_pet
          @pet = Pet.find(params[:id])
        end

end
