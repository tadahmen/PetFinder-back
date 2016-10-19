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
      #t.references :owner, foreign_key: true
      #t.references :finders

      t.timestamps
    end
  end
end
