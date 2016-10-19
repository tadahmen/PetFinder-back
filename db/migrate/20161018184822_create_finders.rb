class CreateFinders < ActiveRecord::Migration[5.0]
  def change
    create_table :finders do |t|
      t.string :alias
      t.text :description
      #t.references :pets
      #t.references :followers

      t.timestamps
    end
  end
end
