class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :name, null: false, unique: false
      
      t.references :city, index: true, foreign_key: true, null: false, unique: false

      t.timestamps null: false
    end
  end
end
