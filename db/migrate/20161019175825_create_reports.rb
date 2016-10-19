class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title, null: false, unique: false
      t.string :street, null: false, unique: false
      t.string :house, null: true, unique: false
      t.string :short_place_desc, null: true, unique: false
      t.string :desc, null: false, unique: false
      t.string :image, null: true, unique: false
      t.string :ip, null: false, unique: false
      
      t.references :user, index: true, foreign_key: true, null: false, unique: false
      t.references :report_category, index: true, foreign_key: true, null: false, unique: false

      t.timestamps null: false
    end
  end
end
