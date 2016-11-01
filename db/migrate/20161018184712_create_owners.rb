class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.string :alias
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
