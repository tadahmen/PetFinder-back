class PetsController < ApplicationController
    def new
        @pet=Pet.new
    end

    # POST /pets
    # POST /pets.json
    def create
        @pet=Pet.new(pet_params)

        if@pet.save
            redirect_to root_path, notice: "saved #{@pet.name} :)"
        else
            render :new
        end
    end

    private

    def pet_params
        params.require(:pet).permit(:name, :species)
    end

end
