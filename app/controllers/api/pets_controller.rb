class Api::PetsController < ApplicationController
    before_action :load_pet, except: [:index, :create, :owners_pets]

    def index
        @pets = Pet.all
        render status: 200, json: {
            pets: @pets.as_json(except: :owner_id)
        }
    end

    def owners_pets
        @owner = Owner.find_by(user_id: session[:current_user_id])
        @pets = Pet.where(owner: @owner)

        render status: 200, json: {
            pets: @pets.as_json(except: :owner_id),
        }
    end

    def show
        render_pet#(except: :owner_id)
    end

    def create
      @pet = Pet.new
      @pet.name = pet_params[:name]
      @pet.species = pet_params[:species]
      @pet.owner = Owner.find_by(user_id: session[:current_user_id])

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
        render_errors "Could not destroy this lovely pet, sorry"
      end
    end


    private

        def pet_params
          params.require(:pet).permit(:name, :species, :description, :reward, :image, :status)
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
