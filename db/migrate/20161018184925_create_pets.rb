class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
        t.string :name
        t.string :species
        t.json :lastSeen
        t.date :datePosted
        t.string :reward
        t.text :description
        t.string :image
        t.string :status
        t.references :owner, index: true

        t.timestamps
    end

    create_table :finders_pets, id: false do |t|
        t.belongs_to :pet, index: true
        t.belongs_to :finder, index: true
    end
  end
end
